require 'rails_helper'

RSpec.feature "view newest posts at the top", type: :feature do
  scenario "User will see newest posts at the top of the post page" do
    Post.create(message: "abc")
    sleep(0.1)
    Post.create(message: "def")
    visit '/posts'
    expect("def").to appear_before("abc")
  end

  scenario "User will see newest posts at the top of the index page" do
    Post.create(message: "abc")
    sleep(0.1)
    Post.create(message: "def")
    visit '/'
    user_email = "bob@bob.com"
    user_password = "1234567890"
    click_link "Sign up"
      fill_in "Email", with: user_email
      fill_in "Password", with: user_password
      fill_in "Password confirmation", with: user_password
      click_button "Sign up"
      expect("def").to appear_before("abc")
  end

end
