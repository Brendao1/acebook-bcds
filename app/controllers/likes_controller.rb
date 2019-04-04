class LikesController < ApplicationController
  before_action :find_post
  before_action :find_like

  def create
    @post.likes.create(user_id: current_user.id)
    redirect_to root_url
  end

  def destroy
    #Like.destroy(@like.ids) # previous solution 
    @like.destroy
    redirect_to root_url
  end

private
  def find_post
    @post = Post.find_by(id: params[:post_id])
  end

  def find_like
    @like = Like.find_by(user_id: current_user.id, post_id: params[:post_id])
    # previous solution: @like = Like.where
    # ActiveRecords finder methods like 'where' return a list of matches.
    # In this case, our database entity relationships mean there can be only one
  end
end
