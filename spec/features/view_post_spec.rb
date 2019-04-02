require 'rails_helper'

RSpec.feature "View posts", type: :feature do
    scenario "posts are viewed when user signs up" do
        another_user = User.create(email: 'another@a.com', password: "1234567890")
        post = Post.create(message: "abcdefg", user_id: another_user.id)
        user = sign_up_bob
        expect(page).to have_content("abcdefg")
    end
end