class RemoveTicketPriceFromTickets < ActiveRecord::Migration[5.0]
  def change
    remove_column :tickets, :ticket_price, :integer
  end
end
