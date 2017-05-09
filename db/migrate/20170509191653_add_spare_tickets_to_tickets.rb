class AddSpareTicketsToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :amount_tickets_spare, :integer
  end
end
