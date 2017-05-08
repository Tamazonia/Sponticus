class ChangePhotoName < ActiveRecord::Migration[5.0]
  def change

    def change
    rename_column :events, :url, :photo
  end
  end
end
