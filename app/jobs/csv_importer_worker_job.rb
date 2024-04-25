require 'csv'
class CsvImporterWorkerJob < ApplicationJob
  queue_as :default

  #Process and upload csv data into database
  def perform(file)
    
    CSV.foreach(file, headers:true) do |row|
      inspection_data = {
        inspection_score: row['inspection_score'],
        inspection_date: row['inspection_date'],
        inspection_type: row['inspection_type'],
        violation_date: row['violation_date'],
        violation_type: row['violation_type'],
        risk_category: row['risk_category'],
        description: row['description']
      }
      restaruant_address = {street: row['address'], city: row['city'], zip_code: row['postal_code'] }
      owner_address = {street: row['owner_address'],city: row['owner_city'], state:row['owner_state'], zip_code:row['owner_zip']}
      
      #Check if an owner with the same address exists in the database
      existing_owner = Owner.joins(:address).where(
        owners: { name: row['owner_name'] },
        addresses: { street: owner_address[:street], city: owner_address[:city], zip_code: owner_address[:zip_code] }
      ).first

      if existing_owner.present?
        #if the owner exists then we return the record
        owner = existing_owner
      else
        #if the owner doesn't exist then we create the record and return it
        owner = Owner.create(name:  row['owner_name'],  address_attributes: owner_address) if row['owner_name'].present?
      end

      #find the restaurant if it exists or not
      existing_restaurant = Restaurant.joins(:address).where(
        name: row['name'],
        addresses: { street: row['address'], city: row['city'], zip_code: row['postal_code'] }
      ).first

      if existing_restaurant.present?
        restaurant = existing_restaurant
      else
        restaurant = Restaurant.create!(
          name: row['name'],
          phone: row['phone_number'],
          owner: owner,
          address_attributes: restaruant_address
        ) #create the restaurant record

      end

      #Insert the inspections, this is okay because inspections can't just be updated because we need to keep a record
      inspection = restaurant.inspection.create(
        inspection_data
      )
    end
  end

end
