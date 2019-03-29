require 'rails_helper'

RSpec.feature "view newest posts at the top", type: :feature do
  scenario "User will see newest posts at the top" do
    Post.create(message: "abc")
    sleep(0.1)
    Post.create(message: "def")
    visit '/posts'
    expect("def").to appear_before("abc")

  end
end
