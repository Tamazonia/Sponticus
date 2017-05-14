class Event < ApplicationRecord
  belongs_to :organizer
  has_many :tickets, dependent: :destroy

end
