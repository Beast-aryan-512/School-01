class ApplicationController < ActionController::Base
   protect_from_forgery with: :exception

   before_action :configure_permitted_parameters, if: :devise_controller?

   # validates :mobile_number, :email, :presence => true
   # validates :mobile_number, :presence => true
   
   def configure_permitted_parameters
      added_attrs = [:mobile_number, :email, :unique_id, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
   end
end
