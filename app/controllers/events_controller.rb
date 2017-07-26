class EventsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @ticket = @event.tickets.last
    @order = Order.new(ticket: @ticket)
    # @order.unit_price = @ticket.price
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.organizer = current_user.organizer
    @event.save
    if @event.save
      if @event.initial_added_tickets == true
        redirect_to new_event_ticket_path(@event)
      else
        redirect_to user_path(current_user)
      end
    else
      redirect_to new_event_path(@event)
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.save
      if @event.initial_added_tickets == true
        redirect_to new_event_ticket_path(@event)
      else
        redirect_to user_path(current_user)
      end
    else
      redirect_to edit_event_path(@event)
    end
  end

  def destroy
  end


  private

  def event_params
    params.require(:event).permit(:event_name, :event_category, :event_description, :event_address_title, :event_address_street, :event_address_postalcode, :event_address_city, :initial_added_tickets, :date, :event_time)
  end

end
