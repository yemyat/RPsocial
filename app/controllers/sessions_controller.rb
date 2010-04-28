class SessionsController < Clearance::SessionsController
  before_filter :can_remember
  def new
    @posts = Post.find(:all, :order => "created_at DESC",:limit=>3)
    if @posts.nil?
      session[:last_retrieval] = 0
    else
      session[:last_retrieval] = @posts.first.id
    end
  end
  private
  def url_after_create
    user_posts_path(:screen_name=>current_user.screen_name)
  end
end
