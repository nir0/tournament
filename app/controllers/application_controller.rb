class ApplicationController < ActionController::Base
  def current_user
    # to make ActionPolicy work
    nil
  end
  
  helper_method :current_user
end
