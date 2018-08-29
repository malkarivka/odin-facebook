class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
    def after_sign_up_path_for(resource)
      current_user
    end

    def after_sign_in_path_for(resource)
      current_user #posts_path
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthday, :gender])
      devise_parameter_sanitizer.permit(:account_update, keys: [:account_update, :last_name, :birthday, :gender])
    end
end
