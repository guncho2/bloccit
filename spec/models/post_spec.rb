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
  let(:post) { topic.posts.create!(title: title, body: body) }

  it { is_expected.to belong_to(:topic) }

 # #2
   describe "attributes" do
     it "has title and body attributes" do
      #  expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
      expect(post).to have_attributes(title: title, body: body)

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
