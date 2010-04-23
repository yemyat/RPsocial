class SessionsController < Clearance::SessionsController
  before_filter :can_remember
  private
  def url_after_create
    user_posts_path(current_user.id)
  end
end
