require 'rails_helper'

RSpec.feature "view newest posts at the top", type: :feature do
  scenario "User will see newest posts at the top of the post page" do
    Post.create(message: "abc")
    sleep(0.1)
    Post.create(message: "def")
    sign_up_bob
    visit '/posts'
    expect("def").to appear_before("abc")
  end

  scenario "User will see newest posts at the top of the index page" do
    Post.create(message: "abc")
    sleep(0.1)
    Post.create(message: "def")
    visit '/'
    sign_up_bob
    expect("def").to appear_before("abc")
  end

end
