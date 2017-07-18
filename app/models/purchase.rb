class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validates :amount_tickets_purchased, numericality: { only_integer: true, greater_than: 0 }

  after_create :send_sold_email, :send_bought_email

  private

  def send_sold_email
    UserMailer.sold(self.ticket.event.organizer, self).deliver_now
  end

   def send_bought_email
    UserMailer.bought(self.user, self).deliver_now
  end

end
