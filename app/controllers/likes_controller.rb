class LikesController < ApplicationController

    def new
        @like = Like.new
    end

    def create
        @like = Like.create(post[:post_id],  user[user_id])
    end
end
