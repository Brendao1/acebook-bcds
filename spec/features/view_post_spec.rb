require 'rails_helper'

RSpec.feature "View posts", type: :feature do
    scenario "posts are viewed when user signs up" do
        another_user = User.create(email: 'another@a.com', password: "1234567890")
        post = Post.create(message: "abcdefg", user_id: another_user.id)
        user = sign_up_bob
        expect(page).to have_content("abcdefg")
    end
    scenario "users's own posts are viewed when user signs up" do
        user = sign_up_bob
        click_link "Logout"
        bobs_post = Post.create(message: "bob's post", user_id: user.id)
        visit '/'
        click_link "Login"
        fill_in "Email", with: "bob@bob.com"
        fill_in "Password", with: "1234567890"
        click_button "Log in"
        expect(page).to have_content("bob's post")
    end

end