class PurchasesController < ApplicationController
  def new
    @event= Event.find(params[:event_id])
    @ticket = @event.tickets.last
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @ticket = Ticket.find(params[:ticket_id])
    @purchase.total_price = @purchase.amount_tickets_purchased * @ticket.ticket_price
    @purchase.user = current_user
    @purchase.ticket = @ticket
    @purchase.save
    @ticket.amount_tickets_sold += @purchase.amount_tickets_purchased
    @ticket.amount_tickets_spare = @ticket.amount_tickets_to_sell - @purchase.amount_tickets_purchased
    @ticket.save

    redirect_to user_path(current_user)
  end

  private

  def purchase_params
    params.require(:purchase).permit(:amount_tickets_purchased)
  end
end
