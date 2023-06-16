# require 'rails_helper'

# RSpec.describe Comment, type: :model do
#   let(:user) { User.create(name: 'John Doe') }
#   let(:post) { Post.create(author: user, title: 'Sample Post') }
#   let(:comment) { Comment.new(post: post, author: user, text: 'Sample Comment') }

#   describe '#update_post_comments_counter' do
#     it 'updates the post comments_counter attribute' do
#       comment.save
#       p comment.errors.full_messages.to_sentence
#       expect { comment.update_post_comments_counter }.to change { post.comments_counter }.by(1)
#     end
#   end
# end
