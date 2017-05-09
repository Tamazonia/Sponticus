class Event < ApplicationRecord
  belongs_to :organizer
  has_one :ticket
end
