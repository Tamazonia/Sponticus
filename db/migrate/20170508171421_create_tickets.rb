class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :amount_tickets_to_sell
      t.integer :ticket_price
      t.text :ticket_details
      t.references :event, foreign_key: true

      t.timestamps
    end
  end
end
