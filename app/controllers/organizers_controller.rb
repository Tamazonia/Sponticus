class OrganizersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @organizer = Organizer.new
    authorize @organizer
  end

  def create
    @organizer = Organizer.new(organizer_params)
    @organizer.user = current_user
    authorize @organizer
    @organizer.save
    if @organizer.save
      redirect_to user_path(current_user)
    else
      redirect_to new_organizer_path
    end
  end

  def edit
    @organizer = Organizer.find(params[:id])
    authorize @organizer
  end

  def update
    @organizer = Organizer.find(params[:id])
    @organizer.update(organizer_params)
    authorize @organizer
    if @organizer.save
      redirect_to user_path(current_user)
    else
      redirect_to edit_organizer_path
    end
  end

  def destroy
  end


  private

  def organizer_params
    params.require(:organizer).permit(:organizer_name, :organizer_address_title, :organizer_address_street, :organizer_address_postalcode, :organizer_address_city)
  end

end
