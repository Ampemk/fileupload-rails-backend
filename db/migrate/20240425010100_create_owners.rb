class CreateOwners < ActiveRecord::Migration[7.0]
  def change
    create_table :owners do |t|
      t.string :name
      t.timestamps
    end
    add_index :owners, :name
  end
end
