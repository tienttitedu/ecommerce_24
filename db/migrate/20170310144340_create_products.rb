class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 12, scale: 3
      t.integer :quantity, default: 0
      t.integer :rate
      t.references :category, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
