require 'rails_helper'

RSpec.describe Post, type: :model do


  # #1
  #  let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }
  let(:name) { RandomData.random_sentence }
  let(:description) { RandomData.random_paragraph }
  let(:title) { RandomData.random_sentence }
  let(:body) { RandomData.random_paragraph }
# #3
  let(:topic) { Topic.create!(name: name, description: description) }
# #4
  # let(:post) { topic.posts.create!(title: title, body: body) }

  #1
   let(:user) { User.create!(name: "Bloccit User", email: "user@bloccit.com", password: "helloworld") }
 # #2
   let(:post) { topic.posts.create!(title: title, body: body, user: user) }
   it { is_expected.to have_many(:comments) }
   

  it { is_expected.to belong_to(:topic) }
   it { is_expected.to belong_to(:user) }

#1
  it { is_expected.to validate_presence_of(:title) }
   it { is_expected.to validate_presence_of(:body) }
   it { is_expected.to validate_presence_of(:topic) }
   it { is_expected.to validate_presence_of(:user) }
#2
   it { is_expected.to validate_length_of(:title).is_at_least(5) }
   it { is_expected.to validate_length_of(:body).is_at_least(20) }


 # #2
   describe "attributes" do
    #  it "has title and body attributes" do
    #   #  expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
    #   expect(post).to have_attributes(title: title, body: body)
    it "has a title, body, and user attribute" do
       expect(post).to have_attributes(title: title, body: body, user: user)

     end
   end
end


#At #1, using the let method, we create a new instance of the Post class, and name it post.
# let dynamically defines a method (in this case, post), and, upon first call within a spec
# (the it block), computes and stores the returned value.

#At #2, we test whether post has attributes named title and body. This tests whether post
# will return a non-nil value when post.title and post.body is called.
#At #3, we create a parent topic for post.

#At #4, we associate post with topic via topic.posts.create!. This is a chained
# method call which creates a post for a given topic.
#At #1, we test that Post validates the presence of title, body, and topic.
# At #2, we test that Post validates the lengths of title and body.
