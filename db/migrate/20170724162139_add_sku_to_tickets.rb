class AddSkuToTickets < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :sku, :string
  end
end
