class Ticket < ApplicationRecord
  belongs_to :event
  has_many :purchases

validates :amount_tickets_to_sell, :ticket_price, presence: true

  # after_create :calculate_amount_tickets_sold_and_spare
  #   private
  #   def calculate_amount_tickets_sold_and_spare
  #     self.amount_tickets_sold
  #
  #   end
end
