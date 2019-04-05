require 'rails_helper'

RSpec.feature 'User can update post', type: :feature do
  scenario "Post's user_id is added to table" do
    user = sign_up_bob
    click_link 'New post'
    fill_in 'Message', with: 'Hello, world!'
    click_button 'Submit'
    expect(Post.all[0].user_id).to eq user.id
  end
end
