require 'rails_helper'

RSpec.feature "view newest posts at the top", type: :feature do
  scenario "User will see newest posts at the top of the post page" do
    user = User.create(email: 'a@a.com', password: '1234567890')
    Post.create(message: "abc", user_id: user.id)
    sleep(0.1)
    Post.create(message: "def", user_id: user.id)
    sign_up_bob
    visit '/posts'
    expect("def").to appear_before("abc")
  end

  scenario "User will see newest posts at the top of the index page" do
    user = User.create(email: 'a@a.com', password: '1234567890')
    Post.create(message: "abc", user_id: user.id)
    sleep(0.1)
    Post.create(message: "def", user_id: user.id)
    visit '/'
    sign_up_bob
    expect("def").to appear_before("abc")
  end

end
