require 'rails_helper'

# RSpec::Matchers.define :appear_before do |later_content|
#  match do |earlier_content|
#    page.body.index(earlier_content) < page.body.index(later_content)
#  end
# end

RSpec.feature "view newest posts at the top", type: :feature do
  scenario "User will see newest posts at the top" do
    Post.create(message: "abc")
    sleep(3)
    Post.create(message: "def")
    visit '/posts'
    expect("def").to appear_before("abc")

    # expect(page).to have_content
    # visit "/posts"
    # click_link "New post"
    # fill_in "Message", with: "Hello, world!"
    # click_button "Submit"
    # expect(page).to have_content("Hello, world!")
  end
end
