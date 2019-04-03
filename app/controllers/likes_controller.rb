class LikesController < ApplicationController
  before_action :find_post, :find_like

  def create
    if already_liked?
       destroy
    else
       @post.likes.create(user_id: current_user.id)
    end
    redirect_to root_url
  end

  def destroy
    @like.destroy
    redirect_to root_url
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id: params[:post_id]).exists?
  end

private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = Like.find(params[:id])
  end
end
