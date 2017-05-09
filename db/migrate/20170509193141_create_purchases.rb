class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.integer :amount_tickets_purchased
      t.integer :total_price
      t.references :user, foreign_key: true
      t.references :ticket, foreign_key: true

      t.timestamps
    end
  end
end
