class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.string :state, null: true
      t.string :zip_code
      t.references :restaurant, foreign_key: true, null: true
      t.references :owner, foreign_key: true, null: true
      t.timestamps
    end

      add_index :addresses, :zip_code
      add_index :addresses, [:city, :state]

  end
end
