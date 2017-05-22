class UsersController < ApplicationController
  def show
    #@user = User.find(params[:id])
    @user = current_user
    @organizer = @user.organizer
    @purchases = @user.purchases


  end
end
