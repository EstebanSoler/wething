class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) do |u|
      u.permit(:email, :password)
    end

    devise_parameter_sanitizer.for(:sign_up) do
      |u| u.permit(
        :first_name, :last_name, :email, :password, :password_confirmation
      )
    end
  end
end
