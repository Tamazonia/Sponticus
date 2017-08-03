class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
    @user = current_user
    @events = Event.all

    @closest_events = @events.where("date >=?", Time.now).order(date: :asc)


    # film.showings.where("show_time >= ?", Time.now).order(show_time: :asc).first
  end

  def about
  end
end
