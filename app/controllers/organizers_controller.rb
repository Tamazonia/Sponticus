class OrganizersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @organizer = Organizer.new
  end

  def create
    @organizer = Organizer.new(organizer_params)
    @organizer.user = current_user
    @organizer.save
    if @organizer.save
      redirect_to user_path(current_user)
    else
      redirect_to new_organizer_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def organizer_params
    params.require(:organizer).permit(:organizer_name, :organizer_address_title, :organizer_address_street, :organizer_address_postalcode, :organizer_address_city)
  end

end
