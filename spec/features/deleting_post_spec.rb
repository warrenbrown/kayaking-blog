require 'rails_helper'

RSpec.feature 'Users can delete post' do
  scenario 'successfully' do
    post = FactoryGirl.create(:post)

    visit '/'

    click_link post.title
    click_link 'Delete Post'

    expect(page).to have_content 'Post has been deleted.'
    expect(page.current_url).to eq posts_url
    expect(page).not_to have_content post.title
  end
end
