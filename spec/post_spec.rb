require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'John Doe', posts_counter: 0) }
  let(:post) { Post.new(author_id: user, title: 'Sample Post', likes_counter: 0, comments_counter: 0) }
  let(:comment1) { Comment.create(post_id: post.id, user_id: user.id, text: 'Sample Comment') }
  let(:comment2) { Comment.create(post_id: post.id, user_id: user.id, text: 'Sample Comment') }
  let(:comment3) { Comment.create(post_id: post.id, user_id: user.id, text: 'Sample Comment') }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe '#recent_comments' do
    it 'returns the recent comments in descending order' do
      post.save
      expect(post.recent_comments.count).to eq(3)
    end
  end

  describe '#update_user_posts_counter' do
    it 'updates the user posts_counter attribute' do
      post.save
      expect { post.update_user_posts_counter }.to change { user.posts_counter }.by(1)
    end
  end
end
