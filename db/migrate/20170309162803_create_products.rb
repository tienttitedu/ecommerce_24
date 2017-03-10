class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string, :name
      t.text, :description
      t.float, :price
      t.int, :quantity
      t.int :rate
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
