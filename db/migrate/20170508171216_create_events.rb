class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_category
      t.text :event_description
      t.string :event_address_title
      t.string :event_address_street
      t.integer :event_address_postalcode
      t.string :event_address_city
      t.references :organizer, foreign_key: true

      t.timestamps
    end
  end
end
