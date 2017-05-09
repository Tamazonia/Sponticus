class TicketsController < ApplicationController
  def index
  end

  def show
  end

  def new
    # do i really need that or can I do this on events similar as we did Review for the Doctor?
    @ticket = Ticket.new
  end

  def create
    # do i really need that or can I do this on events similar as we did Review for the Doctor?
    def create
    @ticket = Ticket.new(ticket_params)
    @ticket.amount_tickets_spare = @ticket.amount_tickets_to_sell
    @ticket.tickets_sold = 0
    @event = Event.find(params[:event_id])
    @ticket.event = @event
    @ticket.save


    redirect_to event_path(@event)
  end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def ticket_params
    params.require(:ticket).permit(:amount_tickets_to_sell, :ticket_price, :ticket_details, :event_id)
    # amount_tickets_spare and amount_tickets_sold nicht drauf, da kein Usr Input sein soll

  end

end
