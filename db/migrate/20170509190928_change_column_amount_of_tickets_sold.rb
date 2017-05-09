class ChangeColumnAmountOfTicketsSold < ActiveRecord::Migration[5.0]
  def change

    rename_column :tickets, :amount_of_tickets_sold, :amount_tickets_sold
  end
end
