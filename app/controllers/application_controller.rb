class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  layout :layout_by_resource
 
  private

  def layout_by_resource
    if devise_controller?
      "web/layouts/application"
    else
      "web/layouts/application"
    end
  end
end
