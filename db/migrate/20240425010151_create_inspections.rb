class CreateInspections < ActiveRecord::Migration[7.0]
  def change
    create_table :inspections do |t|
      t.integer :inspection_score, null: true
      t.string :inspection_type
      t.string :risk_category
      t.text :description
      t.integer :violation_type
      t.date :inspection_date
      t.date :violation_date
      t.references :restaurant, foreign_key: true, null: false
      t.timestamps
    end
      add_index :inspections, :violation_type
  end
end
