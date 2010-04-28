class PostsController < ApplicationController
  before_filter :authenticate,:except=>[:fetch_limited_posts,:show]
 
  
  def index
    @posts = Post.paginate(:page=>params[:page] || 1,:per_page => 5,:order => "created_at DESC")
    unless @posts.first.nil?
      if params[:page] == 1 or params[:page].nil?
        session[:last_retrieval] = @posts.first.id
      end
    end
    respond_to do |format|
      format.html
      format.xml {render :xml => Post.all}
    end
  end

  def show
    @post = Post.find(params[:id])
    @page_title = @post.status
    respond_to do |format|
      format.html
    end
  end

  def create
    @post = current_user.posts.create!(:status =>  params[:status])
    session[:last_retrieval] =@post.id
    respond_to do |format|
      format.html {redirect_to user_posts_path(:screen_name=>current_user.screen_name)}
      format.js {render :partial=>@post}
    end
  end

  def fetch_new_posts
    @updated_posts = Post.find(:all,:conditions=>['id > ?',session[:last_retrieval]],:order=>"created_at DESC")
    unless @updated_posts.nil?
      respond_to do |format|
        format.html {redirect_to user_posts_path(:screen_name=>current_user.screen_name)}
        format.js {render :partial=>@updated_posts}
        session[:last_retrieval] = @updated_posts.first.id
      end
    end
  end

  def fetch_limited_posts
    @updated_posts = Post.find(:all,:conditions=>['id > ?',session[:last_retrieval]],:order=>"created_at DESC")
    unless @updated_posts.nil?
      respond_to do |format|
        format.html{redirect_to :root}
        format.js {render :partial=>@updated_posts}
        session[:last_retrieval] = @updated_posts.first.id
      end
    end
  end
end