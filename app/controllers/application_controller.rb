# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include Clearance::Authentication
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  def can_remember
    if current_user and signed_in?
      redirect_to user_posts_path(:screen_name => current_user.screen_name)
    end
  end

  def is_correct_user
    unless current_user.screen_name == params[:screen_name]
      
      redirect_to sign_out_path
    
    end
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
