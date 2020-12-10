class ApplicationController < ActionController::Base
    before_action :configure_devise_parameters, if: :devise_controller?
    before_action :set_locale

    def set_locale
        if !params[:locale]
            I18n.locale = locale_from_header
        else
            I18n.locale = I18n.default_locale
        end
    end

    def locale_from_header
        request.env.fetch('HTTP_ACCEPT_LANGUAGE', '').scan(/[a-z]{2}/).first
    end

    def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :adress, :adress_sup, :door_code, :city, :zipcode, :phone_number, :email, :current_password, :password, :password_confirmation)}
    end

    def after_sign_in_path_for(resource)
        if resource.is_a?(Admin)
            rails_admin_path
        elsif resource.is_a?(User)
            users_path
        end
    end
end
