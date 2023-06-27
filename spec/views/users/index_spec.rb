require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  before do
    User.create(name: 'John Doe', photo: 'john.jpg', posts_counter: 0)
    User.create(name: 'Jane Smith', photo: 'jane.jpg', posts_counter: 0)
  end

  it 'displays the username of all other users' do
    visit users_path
    expect(page).to have_text('John Doe')
    expect(page).to have_text('Jane Smith')
  end

  it 'displays the profile picture for each user' do
    visit users_path
    expect(page).to have_css("img[src*='john.jpg']")
    expect(page).to have_css("img[src*='jane.jpg']")
  end

  it 'displays the number of posts each user has written' do
    User.find_by(name: 'John Doe').posts.create(title: 'First Post', text: 'Lorem ipsum', comments_counter: 0)
    User.find_by(name: 'Jane Smith').posts.create(title: 'Second Post', text: 'Dolor sit amet', comments_counter: 0)

    visit users_path
    expect(page).to have_text('Number of Posts: 0')
  end

  it 'redirects to user show page when clicking on a user' do
    visit users_path
    click_link('John Doe', match: :first)
    expect(current_path).to eq(user_path(User.find_by(name: 'John Doe')))
  end
end