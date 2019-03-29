require 'rails_helper'

RSpec.feature "posts show the time they were created", type: :feature do
  scenario "User will see the date at which the posts were created" do
    Post.create(message: "abc", created_at: Time.now())
    user_email = "bob@bob.com"
    user_password = "1234567890"
    visit "/"
    click_link "Sign up"
    fill_in "Email", with: user_email
    fill_in "Password", with: user_password
    fill_in "Password confirmation", with: user_password
    click_button "Sign up"
    expect(page).to have_content(Time.now.strftime('%d-%m-%Y'))
  end
end
