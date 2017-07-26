class UsersController < ApplicationController
  def show
    #@user = User.find(params[:id])
    @user = current_user
    @organizer = @user.organizer
    @orders = @user.orders


  end
end
