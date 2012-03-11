class ApplicationController < ActionController::Base
  protect_from_forgery

  def stored_location_for re
    nil
  end
  def after_sign_in_path_for(resource_or_scope)
    puts "*************after sign in!"
    session[:current_year] = Date.today.year
    root_path

  end
end
