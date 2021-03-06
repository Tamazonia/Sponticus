class TicketsController < ApplicationController
  def index
  end

  def new
    # do i really need that or can I do this on events similar as we did Review for the Doctor?
    @event= Event.find(params[:event_id])
    @ticket = Ticket.new
    authorize @ticket

    # why organizer? for me more logical event
    # @ticket = @event.build_organizer


  end

  def create
    # do i really need that or can I do this on events similar as we did Review for the Doctor?
    @event= Event.find(params[:event_id])
    @ticket = Ticket.new(ticket_params)
    @ticket.amount_tickets_spare = @ticket.amount_tickets_to_sell
    @ticket.amount_tickets_sold = 0
    @ticket.event = @event
    authorize @ticket
    @ticket.save


    if @ticket.save
      redirect_to user_path(current_user)
    else
      redirect_to new_event_ticket_path(@event)
    end
  end



  def edit
    @event= Event.find(params[:event_id])
    @ticket = @event.tickets.last
    authorize @ticket
  end

  def update
    @event= Event.find(params[:event_id])
    @ticket = @event.tickets.last
    authorize @ticket
    @ticket.update(ticket_params)
    if @ticket.save
      redirect_to event_path(@event)
    else
      redirect_to edit_event_ticket_path(@event)
    end
  end

  def destroy
  end

  def show
    @event = Event.find(params[:event_id])
    # @ticket = @event.tickets.find(params[:id])
    @ticket = Ticket.find(params[:id])
    authorize @ticket
    @orders = @ticket.orders
  end

  private

  def ticket_params
    params.require(:ticket).permit(:amount_tickets_to_sell, :price, :ticket_details, :event_id)
    # amount_tickets_spare and amount_tickets_sold nicht drauf, da kein Usr Input sein soll

  end

end
