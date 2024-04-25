class Address < ApplicationRecord
    belongs_to :restaurant, optional: true
    belongs_to :owner, optional: true

    validates :street, :city, :zip_code, presence: true

    def full_address
      "#{street}, #{city}, #{state} #{zip_code}"
    end

    #fetch the state based on the postal_code from Google maps api
    def get_state
    end

end
