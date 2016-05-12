require 'rails_helper'

RSpec.feature 'users can view post' do
  scenario 'with correct details' do
    post = FactoryGirl.create(:post)

    visit '/'

    click_link post.title

    expect(page.current_url).to eq post_url(post)
    expect(page).to have_content post.content
  end
end
