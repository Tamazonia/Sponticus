class AddInitialTicketsToEvents < ActiveRecord::Migration[5.0]
  def change


    add_column :events, :initial_added_tickets, :boolean

  end
end
