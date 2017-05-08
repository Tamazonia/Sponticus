class AddAmountOfTicketsSoldToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :amount_of_tickets_sold, :integer
  end
end
