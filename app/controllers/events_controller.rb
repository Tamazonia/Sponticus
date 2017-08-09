class EventsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def index
    @search = Search.new
    @events = Event.all

    if params[:event_search] && params[:event_search][:event_name].present?
      @name = params[:event_search][:event_name]
      @events = @events.where("event_name ILIKE  ?", "%#{@name}%")
    end

    if params[:event_search] && params[:event_search][:event_category].present?
      @category = params[:event_search][:event_category]
      @events = @events.where("event_category ILIKE  ?", "%#{@category}%")
    end

    if params[:event_search] && params[:event_search][:event_date].present?
      @date = params[:event_search][:event_date]
      @events = @events.where("DATE(date) = ?", "%#{@date}%")
    end

    categories = []
    @events.each do |event|
      categories << event.event_category
    end
    @categories = categories.uniq

  end

  def show
    @event = Event.find(params[:id])
    @ticket = @event.tickets.last
    @order = Order.new(ticket: @ticket)
    # @event_coordinates = { lat: @event.latitude, lng: @event.longitude }
    # @events = @event


    # @events = Event.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@event) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
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
        redirect_to event_path(@event)
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
        redirect_to event_path(@event)
    else
      redirect_to edit_event_path(@event)
    end






  end

  def destroy
  end


  private

  def event_params
    params.require(:event).permit(:event_name, :event_category, :event_description, :event_address_title, :event_address_street, :event_address_postalcode, :event_address_city, :initial_added_tickets, :date, :event_time, :photo, :photo_cache)
  end

end
