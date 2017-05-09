class EventsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end

  def show
      @event = Event.find(params[:id])

  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
