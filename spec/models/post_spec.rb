require 'rails_helper'

RSpec.describe Post, type: :model do
  

  # #1
   let(:post) { Post.create!(title: "New Post Title", body: "New Post Body") }

 # #2
   describe "attributes" do
     it "has title and body attributes" do
       expect(post).to have_attributes(title: "New Post Title", body: "New Post Body")
     end
   end
end


#At #1, using the let method, we create a new instance of the Post class, and name it post.
# let dynamically defines a method (in this case, post), and, upon first call within a spec
# (the it block), computes and stores the returned value.

#At #2, we test whether post has attributes named title and body. This tests whether post
# will return a non-nil value when post.title and post.body is called.