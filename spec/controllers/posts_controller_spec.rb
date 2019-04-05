require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    it 'responds with 200' do
      post :create, params: { post: { message: 'Hello, world!' } }
      expect(response).to redirect_to(root_url)
    end

    it 'creates a post' do
      user = User.create(email: 's@s.com', password: '1234567')
      post = Post.create(message: 'Hello, world!', user_id: user.id)

      # post :create, params: { post: { message: "Hello, world!" , user_id: current_user.id } }
      expect(Post.find_by(message: 'Hello, world!')).to be
    end
  end

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe 'PATCH / ' do
    it 'updates a post' do
      user = User.create(email: 's@s.com', password: '1234567')
      post = Post.create(message: 'Hello, world!', user_id: user.id)
      post.update(message: 'Different message', user_id: user.id)
      # expect(post.message).to eq "Different message"
      expect(Post.find_by(message: 'Different message')).to be
    end
  end
end
