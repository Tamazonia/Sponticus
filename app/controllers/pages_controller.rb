class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
    @user = current_user
    @events = Event.all
    categories = []
    @events.each do |event|
      categories << event.event_category
    end
    @categories = categories.uniq

    @closest_events = @events.where("date >=?", Time.now).order(date: :asc)
    @search = Search.new

  end

  def about
  end
end
