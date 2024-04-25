class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name, null:false
      t.bigint :phone, null: true
      t.references :owner, foreign_key: true, null: true
      t.timestamps
    end
      add_index :restaurants, :name

  end
end
