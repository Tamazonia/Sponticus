class AddArrivedToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :arrived, :integer
  end
end
