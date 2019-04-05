require 'rails_helper'

RSpec.feature 'posts show the time they were created', type: :feature do
  scenario 'User will see the date at which the posts were created' do
    user_email = 'bob@bob.com'
    user_password = '1234567890'

    user = sign_up_bob
    Post.create(message: 'abc', created_at: Time.now, user_id: user.id)

    visit '/'

    expect(page).to have_content(Time.now.strftime('%d-%m-%Y'))
  end
end
