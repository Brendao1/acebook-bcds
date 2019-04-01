require 'rails_helper'

RSpec.feature "user can update post", type: :feature do
  scenario "The userid of the post creator will be added to the table" do
    sign_up_bob
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(Post.all[0].user_id).to eq current_user.id
  end
end
