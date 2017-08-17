class AddLinkToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_link, :string
  end
end
