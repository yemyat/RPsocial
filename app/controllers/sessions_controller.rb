class SessionsController < Clearance::SessionsController
  before_filter :can_remember

  def new
    @posts = Post.find(:all, :order => "created_at DESC",:limit=>3)
    session[:last_retrieval] = @posts.first.id


  end
  private
  def url_after_create
    user_posts_path(:screen_name=>current_user.screen_name)
  end
end
