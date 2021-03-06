class Order < ApplicationRecord
  belongs_to :ticket
  belongs_to :user
  monetize :amount_cents

  after_create :send_sold_email
  after_save :reduce_spare_ticket, if: :state_changed?
  after_create :noone_arrived

  private

  def send_sold_email
    if self.state == "paid"
      UserMailer.sold(self.ticket.event.organizer, self).deliver_now
    end
  end

  def reduce_spare_ticket
      @ticket = self.ticket
      if self.state == "paid"
        @ticket.amount_tickets_sold += self.quantity
        @ticket.amount_tickets_spare = @ticket.amount_tickets_to_sell - @ticket.amount_tickets_sold
        @ticket.save
      end
  end

  def noone_arrived
    self.arrived = 0
    self.save
  end


end
