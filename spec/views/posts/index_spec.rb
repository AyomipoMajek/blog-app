require 'rails_helper'

RSpec.describe 'User post index page', type: :feature do
  let!(:user) { User.create(name: 'John Doe', photo: 'https://placehold.co/400', posts_counter: 0) }
  let!(:post1) do
    user.posts.create(title: 'Post 1', text: 'Post 1, This is my first post, Lorem ipsum dolor sit amet.',
                      likes_counter: 0, comments_counter: 0)
  end
  let!(:post2) do
    user.posts.create(title: 'Post 2', text: 'Post 2, Lorem ipsum dolor sit amet.', likes_counter: 0,
                      comments_counter: 0)
  end
  let!(:post3) do
    user.posts.create(title: 'Post 3', text: 'Post 3, Lorem ipsum dolor sit amet.', likes_counter: 0,
                      comments_counter: 0)
  end
  let!(:comment1) { Comment.create(user:, post: post1, text: 'my first comment') }
  let!(:comment2) { Comment.create(user:, post: post2, text: 'my second comment') }

  before do
    visit user_posts_path(user)
  end

  it 'displays the user profile picture' do
    expect(page).to have_css("img[src='#{user.photo}']")
  end

  it 'displays the user username' do
    expect(page).to have_content('John Doe')
  end

  it 'displays the number of posts the user has written' do
    expect(page).to have_content('Number of Posts: 3')
  end

  it 'displays a post title' do
    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
  end

  it "displays part of the post's body" do
    expect(page).to have_content('Lorem ipsum dolor sit amet.')
  end

  it 'displays the first comments on a post' do
    expect(page).to have_content("#{post1.comments.first.user.name}: #{post1.comments.first.text}")
  end

  it 'displays the number of comments a post has' do
    expect(page).to have_content("Comments: #{post1.comments.count}")
  end

  it 'displays the number of likes a post has' do
    expect(page).to have_content("Likes: #{post1.likes.count}")
  end

  it 'has a section for pagination if there are more posts than fit on the view' do
    expect(page).to have_link('Pagination', href: user_posts_path(user))
  end

  it "When I click a user's post, it redirects me to that post's show page." do
    click_on post1.title
    expect(page).to have_content('This is my first post')
  end
end
