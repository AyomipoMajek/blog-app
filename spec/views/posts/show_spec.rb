require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  let!(:user) { User.create(name: 'John Doe', posts_counter: 0) }
  let!(:post) do
    Post.create(title: 'Test Post', text: 'Test Post, Lorem ipsum dolor sit amet.', author: user, likes_counter: 0,
                comments_counter: 0)
  end
  let!(:comment1) { Comment.create(text: 'Comment 1', user:, post:) }
  let!(:comment2) { Comment.create(text: 'Comment 2', user:, post:) }

  before do
    visit post_path(post)
  end

  it 'displays the post title' do
    expect(page).to have_content('Test Post')
  end

  it 'displays the author of the post' do
    expect(page).to have_content("by #{user.name}")
  end

  it 'displays the number of comments the post has' do
    expect(page).to have_content('Comments: 2')
  end

  it 'displays the number of likes the post has' do
    expect(page).to have_content('Likes: 0') # Assuming initial likes count is 0
  end

  it 'displays the post body' do
    expect(page).to have_content('Lorem ipsum dolor sit amet.')
  end

  it 'displays the username of each commentor' do
    expect(page).to have_content(user.name, count: 3)
  end

  it 'displays the comment each commentor left' do
    expect(page).to have_content('Comment 1')
    expect(page).to have_content('Comment 2')
  end

  it 'allows creating a new comment' do
    fill_in 'Comment', with: 'New comment'
    click_button 'Create Comment'
    expect(page).to have_content('New comment')
  end
end
