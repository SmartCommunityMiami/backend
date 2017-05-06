class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout "web/layouts/application"
 
end
