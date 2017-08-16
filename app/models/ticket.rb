class Ticket < ApplicationRecord
  belongs_to :event
  has_many :purchases
  has_many :orders
  monetize :price_cents

  validates :amount_tickets_to_sell, :price, presence: true
  after_create :set_sku



  # def destroy
  #   raise "Destroy not allowed"
  # end


  private
    # def calculate_amount_tickets_sold_and_spare
    #   self.amount_tickets_sold
    # end

    def set_sku
      self.sku = self.event.event_name
      self.save
    end


end
