class ChangeColumnNameOfPhoto < ActiveRecord::Migration[5.0]
  def change
    rename_column :events, :url, :photo
  end
end
