class PostsController < ApplicationController
  before_filter :authenticate,:except=>[:fetch_limited_posts,:show]
  before_filter :is_correct_user,:except=>[:show]
  
  def index
    @posts = Post.paginate(:page=>params[:page] || 1,:per_page => 10,:order => "created_at DESC")
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
    @post = current_user.posts.create(:status =>  params[:status])
    render :update do |page|
      if @post.save
        page.insert_html :top, :posts, :partial => @post
        page[@post].visual_effect :highlight
        session[:last_retrieval] = @post.id
      else
        flash[:notice] = "Status failed to be updated."
      end
    end
  end

  def fetch_new_posts
    @updated_posts = Post.find(:all,:conditions=>['id > ?',session[:last_retrieval]])
    render :update do |page|
      unless @updated_posts.nil?
        @updated_posts.each do |updated_post|
          page.insert_html :top, "posts", :partial => updated_post
          page[updated_post].visual_effect :highlight
          session[:last_retrieval] = updated_post.id.to_s
        end
      end
    end
  end

  def fetch_limited_posts
    @updated_posts = Post.find(:all,:conditions=>['id > ?',session[:last_retrieval]])
    render :update do |page|
      unless @updated_posts.nil?
        @updated_posts.each do |updated_post|
          page.insert_html :top, "stream", :partial => updated_post
          page[updated_post].visual_effect :highlight
          page[updated_post].visual_effect :shake
          todelete = 'post_'+(updated_post.id-3).to_s
          page.remove todelete
          session[:last_retrieval] = updated_post.id.to_s
        end
      end
    end
  end
end