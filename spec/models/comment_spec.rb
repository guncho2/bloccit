require 'rails_helper'

RSpec.describe Comment, type: :model do

  # let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }

  let(:topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  #  let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
   let(:post) { topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, user: user) }



# let(:comment) { Comment.create!(body: 'Comment Body', post: post) }

# #1
   let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }

 # #2
     it { is_expected.to belong_to(:post) }
     it { is_expected.to belong_to(:user) }
 # #3
     it { is_expected.to validate_presence_of(:body) }
     it { is_expected.to validate_length_of(:body).is_at_least(5) }


describe "attributes" do
  it "has a body attribute" do
    expect(comment).to have_attributes(body: "Comment Body")
  end
end
end

#At #1, we create a comment with an associated user.

#At #2, we test that a comment belongs to a user and a post.

#At #3, we test that a comment's body is present and has a minimum length of five
