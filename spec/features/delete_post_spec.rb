require 'rails_helper'

RSpec.feature "User can delete post", type: :feature do
  scenario "User can delete their own post" do
    user = User.create(email: "a@a.com", password: "1234567890")
    post = Post.create(message: "first message", user_id: user.id)
    visit "/"
    click_link "Login"
    fill_in "Email", with: "a@a.com"
    fill_in "Password", with: "1234567890"
    click_button "Log in"
    click_link "Delete"
    expect(page).not_to have_content("first message")
  end
end
