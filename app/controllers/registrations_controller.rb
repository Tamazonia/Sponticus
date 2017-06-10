class RegistrationsController < Devise::RegistrationsController

  protected

  def after_sign_up_path_for(user)
    if params[:is_organizer].present?
      new_organizer_path
    else
     root_path
    end
  end
end
