class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :subtotal, precision: 12, scale: 3
      t.references :user, foreign_key: true
      t.string :address_shipping
      t.timestamps
    end
  end
end
