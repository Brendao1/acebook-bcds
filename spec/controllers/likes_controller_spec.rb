require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  describe 'GET /new ' do
    it 'We can create a like' do
      user = User.create(email: 'A@a.com', password: '123456789')
      post = Post.create(message: 'hey', user_id: user.id)
      like = Like.create(user_id: user.id, post_id: post.id)
      expect(Like.all[0].user_id).to eq user.id
      expect(Like.all[0].post_id).to eq post.id
    end
  end

  describe ' Destroy ' do
    it 'We can remove a like' do
      user = User.create(email: 'A@a.com', password: '123456789')
      post = Post.create(message: 'hey', user_id: user.id)
      like = Like.create(user_id: user.id, post_id: post.id)
      like.destroy
      expect(Like.all.length).to eq 0
    end
  end
end
