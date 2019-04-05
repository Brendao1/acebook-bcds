require 'rails_helper'

RSpec.feature 'User can update post', type: :feature do
  scenario 'When the post is updated, the new message is shown' do
    user = User.create(email: 'a@a.com', password: '1234567890')
    post = Post.create(message: 'first message', user_id: user.id)
    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'a@a.com'
    fill_in 'Password', with: '1234567890'
    click_button 'Log in'
    click_link 'Update'
    fill_in 'Message', with: 'second message'
    click_button 'Submit'
    expect(page).to have_content('second message')
    expect(page).not_to have_content('first message')
  end
end
