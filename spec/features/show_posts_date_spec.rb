require 'rails_helper'

RSpec.feature "posts show the time they were created", type: :feature do
  scenario "User will see the date at which the posts were created" do

    user_email = "bob@bob.com"
    user_password = "1234567890"

    user = User.create(email: user_email, password: user_password)
    Post.create(message: "abc", created_at: Time.now(), user_id: user.id)

    visit '/'
    click_link 'Login'
    fill_in 'Email', with: user_email
    fill_in 'Password', with: user_password
    
    click_button 'Log in'
    
    expect(page).to have_content(Time.now.strftime('%d-%m-%Y'))
  end
end
