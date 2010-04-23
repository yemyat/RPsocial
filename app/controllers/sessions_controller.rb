class SessionsController < Clearance::SessionsController
  private
  def url_after_create
    user_posts_path(current_user.id)
  end
end
