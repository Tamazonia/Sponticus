class EventsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @search = Search.new
    @events = Event.all

    if params[:search] && params[:search][:name].present?
      @name = params[:search][:name]
      @events = @events.where("event_name ILIKE  ?", "%#{@name}%")
    end

    if params[:search] && params[:search][:date].present?
      @date = params[:search][:date]
      @events = @events.where("DATE(date) = ?", "%#{@date}%")
    end

    if params[:search] && params[:search][:category].present?
      @category = params[:search][:category]
      # @events = @events.joins(:event_categories).where(event_categories: { name:  params[:search][:event_category]})
      @events = @events.where("event_category ILIKE  ?", "%#{@category}%")
    end

     # if params[:search] && params[:search][:street_name].present?
     #  @street = params[:search][:street_name]
     #  @events = @events.where("street_name ILIKE  ?", "%#{@street}%")


      #@doctors = Doctor.near([@doctor.latitude, @doctor.longitude], 10)
      # @doctors.each do |doctor|
      #    @doctors = @doctors.near([doctor.latitude, doctor.longitude], 1000)
      # end

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
