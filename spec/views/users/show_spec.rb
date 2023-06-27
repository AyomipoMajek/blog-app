require 'rails_helper'

RSpec.describe 'Posts', type: :feature do
  describe 'show page' do
    let(:user) do
      User.create(name: 'John', photo: 'https://placehold.co/400', bio: 'Programmer', posts_counter: 0)
    end

    let!(:post1) do
      Post.create(author: user, title: 'First Test', text: 'This is my first post', likes_counter: 0, comments_counter: 0)
    end

    let!(:post2) do
      Post.create(author: user, title: 'Second Test', text: 'This is my second post', likes_counter: 0, comments_counter: 0)
    end

    let!(:post3) do
      Post.create(author: user, title: 'Third Test', text: 'This is my third post', likes_counter: 0, comments_counter: 0)
    end

    before { visit user_path(user) }

    it "renders the user's profile picture" do
      expect(page).to have_css("img[src='#{user.photo}']")
    end

    it "renders the user's username" do
      expect(page).to have_content(user.name)
    end

    it "renders the number of posts the user has written" do
      expect(page).to have_content(user.posts_counter)
    end

    it "renders the user's bio" do
      expect(page).to have_content(user.bio)
    end

    it 'renders first 3 posts of the user' do
      expect(page).to have_content('Post #1')
      expect(page).to have_content('Post #2')
      expect(page).to have_content('Post #3')
    end

    it 'renders a button to redirect to the posts page' do
      expect(page).to have_link('See all posts', href: user_posts_path(user))
    end

    it "redirects to the user's posts index page" do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(user))
    end
  end
end
