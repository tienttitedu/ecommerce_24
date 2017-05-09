class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.references :parent, null: true, default: nil

      t.timestamps
    end
  end
end
