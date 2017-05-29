class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validates :amount_tickets_purchased, numericality: { only_integer: true, greater_than: 0 }
end
