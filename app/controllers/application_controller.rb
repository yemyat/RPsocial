# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Clearance::Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  def can_remember
    if current_user and signed_in?
      redirect_to user_posts_path(current_user)
    end
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
