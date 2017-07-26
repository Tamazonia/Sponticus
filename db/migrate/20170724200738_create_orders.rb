class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :state
      t.string :ticket_sku
      t.monetize :unit_price, currency: { present: false }
      t.integer :quantity
      t.monetize :amount, currency: { present: false }
      t.json :payment
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
