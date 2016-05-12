require 'rails_helper'

RSpec.feature 'Users can edit posts' do

  scenario 'with valid attributes' do
    post = FactoryGirl.create(:post, title: 'Kayaking is da best')
    visit '/'

    click_link 'Kayaking is da best'
    click_link 'Edit Post'

    fill_in 'Title', with: 'Sublime Text 3'
    click_button 'Update Post'

    expect(page).to have_content 'Post has been updated.'
    expect(page).to have_content 'Sublime Text 3'
  end

  scenario 'with invalid attributes' do
    post = FactoryGirl.create(:post, title: 'Kayaking is da best')

    visit '/'

    click_link 'Kayaking is da best'
    click_link 'Edit Post'

    fill_in 'Title', with: ''
    click_button 'Update Post'

    expect(page).to have_content 'Post has not been updated'
  end
end
