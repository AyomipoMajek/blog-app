require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'John Doe', posts_counter: 0) }
  let(:post) { Post.create(author_id: user.id, title: 'Sample Post', likes_counter: 0, comments_counter: 0) }
  let(:comment) { Comment.new(post_id: post.id, user_id: user.id, text: 'Sample Comment') }

  describe '#update_post_comments_counter' do
    it 'updates the post comments_counter attribute' do
      comment.save
      post.reload
      update = post.comments_counter
      expect(update).to eq(1)
    end
  end
end
