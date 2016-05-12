require 'rails_helper'

RSpec.feature 'Users can create post' do
  scenario 'with valid attributes' do
    visit '/'

    click_link 'New Post'
    fill_in 'Title', with:'Sublime Text 3'
    fill_in 'Content', with:'The best text editor.'
    click_button 'Create Post'

    expect(page).to have_content 'Post has been created.'
    expect(page).to have_content 'Sublime Text 3'
  end

  scenario 'with invalid attributes' do
    visit '/'

    click_link 'New Post'
    fill_in 'Title', with: ''
    click_button 'Create Post'

    expect(page).to have_content 'Post has not been created.'
    expect(page).to have_content "Title can't be blank"
  end
end
