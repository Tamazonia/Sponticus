class UsersController < ApplicationController
  def show
    #@user = User.find(params[:id])
    @user = current_user
    @organizer = @user.organizer
    @orders = @user.orders
    @events = @organizer.events

    @events = Kaminari.paginate_array(@events) if @events.class == Array
    @events = @events.page(params[:page]).per(9)
    @events = @events.order("date DESC")




  end
end
