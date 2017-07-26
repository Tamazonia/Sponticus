class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validates :amount_tickets_purchased, numericality: { only_integer: true, greater_than: 0 }
  # validates_presence_of :amount
  after_create :send_sold_email, :send_bought_email
  # before_validation :calculate_amount
  # validate :has_enough_tickets
  # def calculate_amount
  #   self.amount = quantity * unit_price
  # end
  private

  def send_sold_email
    UserMailer.sold(self.ticket.event.organizer, self).deliver_now
  end

   def send_bought_email
    UserMailer.bought(self.user, self).deliver_now
  end

  # def has_enough_tickets
  #   bought = Order.where(sku: ticket.sku).sum(:quantity)
  #   remaining = ticket.seats - bought
  #   if remaining < quantity
  #     errors.add(:ticket, "There's not enough tickets remaining")
  #   end
  # end
end
