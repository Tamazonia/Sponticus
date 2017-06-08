class Event < ApplicationRecord
  belongs_to :organizer
  has_many :tickets, dependent: :destroy
  validates :event_name, :event_address_street, :event_address_postalcode, :event_address_city, :date, :event_time, :event_category, :event_description, presence: true

end
