class CreateOrganizers < ActiveRecord::Migration[5.0]
  def change
    create_table :organizers do |t|
      t.string :organizer_name
      t.string :organizer_address_title
      t.string :organizer_address_street
      t.integer :organizer_address_postalcode
      t.string :organizer_address_city
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
