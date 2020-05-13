class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  #sign_in後のredirect先。
    def after_sign_in_path_for(resource)
      user_home_path(current_user)
    end
#sign_out後のredirect先。
    def after_sign_out_path_for(resource)
      root_path
    end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
