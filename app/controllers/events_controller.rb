class EventsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
  def index
  end

  def show
    @event = Event.find(params[:id])

  end

  def new
    @event = Event.new

    #Im putting ticket because I want the user to be able to add a new Event AND a new ticket at the same time (if hew wants to)
    @ticket = Ticket.new

  end

  def create
    @event = Event.new(event_params)
    @event.organizer = current_user.organizer
    @event.save



    #Im putting ticket because I want the user to be able to add a new Event AND a new ticket at the same time (if hew wants to)
      # @ticket = Ticket.new(ticket_params)
      # @ticket.amount_tickets_spare = @ticket.amount_tickets_to_sell
      # @ticket.tickets_sold = 0
      # @ticket.event = @event
      # @ticket.save

  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def event_params
    params.require(:event).permit(:event_name, :event_category, :event_description, :event_address_title, :event_address_street, :event_address_postalcode, :event_address_city)
  end

  # Is this needed here?
  # def ticket_params
  #   params.require(:ticket).permit(:amount_tickets_to_sell, :ticket_price, :ticket_details, :event_id)

  # end
end
