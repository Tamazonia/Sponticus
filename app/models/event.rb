class Event < ApplicationRecord
  belongs_to :organizer
  has_many :tickets, dependent: :destroy
  validates :event_name, :event_address_street, :event_address_postalcode, :event_address_city, :date, :event_time, :event_category, :event_description, presence: true

  mount_uploader :photo, EventphotoUploader

  geocoded_by :full_address
  after_validation :geocode, if: :full_address_changed?

  def full_address
    "#{event_address_street}, #{event_address_city}"
  end

  def full_address_changed?
    event_address_street_changed? || event_address_city_changed?
  end
end


