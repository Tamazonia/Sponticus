class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @organizer = @user.organizer
  end
end
