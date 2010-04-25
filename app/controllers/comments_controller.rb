class CommentsController < ApplicationController

  def create
    @post_id = params[:post_id]
    @comment = current_user.comments.create(:post_id => @post_id,:comment=>params[:comment])
    respond_to do |format|
        format.html { redirect_to(user_posts_path(:screen_name=>current_user.screen_name)) }
        format.js
      end
    end
  end
