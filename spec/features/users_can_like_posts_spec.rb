require 'rails_helper'

RSpec.feature "User can like a post", type: :feature do
  scenario "User can like a post" do
    another_user = User.create(email: 'another@a.com', password: "1234567890")
    post = Post.create(message: "abcdefg", user_id: another_user.id)
    user = sign_up_bob
    click_link "Like"
    expect(page).to have_content("1 👍")
  end

  scenario "User can't like a post more than once" do
    another_user = User.create(email: 'another@a.com', password: "1234567890")
    post = Post.create(message: "abcdefg", user_id: another_user.id)
    user = sign_up_bob
    click_link "Like"
    click_link "Like"
    expect(page).to have_content("0 👍")
  end

end
