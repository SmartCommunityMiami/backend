class Web::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, :only => [:create]

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up)  { |u| u.permit(:username, :first_name, :last_name, :email, :password) }
    end
end
