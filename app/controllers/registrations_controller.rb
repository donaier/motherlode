class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      sign_out(:user)
      new_user_session_path
    end
end
