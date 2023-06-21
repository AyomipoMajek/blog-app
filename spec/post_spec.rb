require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'John Doe', posts_counter: 0) }
  let(:post) { Post.new(author_id: user.id, title: 'Sample Post', likes_counter: 0, comments_counter: 0) }
  let(:commentq) { Comment.create(post_id: post.id, user_id: user.id, text: 'Sample Comment') }
  let(:commentw) { Comment.create(post_id: post.id, user_id: user.id, text: 'Sample Comment') }
  let(:commente) { Comment.create(post_id: post.id, user_id: user.id, text: 'Sample Comment') }
  let(:commentr) { Comment.create(post_id: post.id, user_id: user.id, text: 'Sample Comment') }
  let(:commentt) { Comment.create(post_id: post.id, user_id: user.id, text: 'Sample Comment') }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe '#recent_comments' do
    it 'returns the recent comments in descending order' do
      five = post.recent_comments
      expect(five).to eq(post.comments.last(5))
    end
  end

  describe '#update_user_posts_counter' do
    it 'updates the user posts_counter attribute' do
      post.save
      user.reload
      update = user.posts_counter
      expect(update).to eq(1)
    end
  end
end
