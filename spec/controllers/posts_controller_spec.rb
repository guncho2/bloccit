require 'rails_helper'
 # #6
RSpec.describe PostsController, type: :controller do

  # #12
    let(:my_topic) { Topic.create!(name:  RandomData.random_sentence, description: RandomData.random_paragraph) }
  # #13
    let(:my_post) { my_topic.posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }



  # #8
#    let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }
#
###14
#
#   describe "GET #index" do
#     it "returns http success" do
#        # #7
#       get :index
#       expect(response).to have_http_status(:success)
#     end
#     it "assigns [my_post] to @posts" do
#   get :index
# # #9
#   expect(assigns(:posts)).to eq([my_post])
# end
#   end


# Because posts will be nested under topics, at #12 we create a parent topic named  my_topic.
#
# At #13, we update how we create my_post so that it will belong to my_topic.
#
# At #14, we remove the index tests. Posts will no longer need an index view because
#
# they'll be displayed on the show view of their parent topic.

#1
describe "GET new" do
  it "returns http success" do
    # get :new
    # #18
      get :new, params: { topic_id: my_topic.id }

    expect(response).to have_http_status(:success)
  end
#2
  it "renders the #new view" do
    # get :new
    # #19
       get :new, params: { topic_id: my_topic.id }

    expect(response).to render_template :new
  end
#3
  it "instantiates @post" do
    # get :new
    # #20
       get :new, params: { topic_id: my_topic.id }

    expect(assigns(:post)).not_to be_nil
  end
end

#At #18, #19, and #20 we update the get :new request to include the id of the parent topic.


describe "POST create" do
 # #4
      it "increases the number of Post by 1" do
        # expect{ post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)
        # #21
       expect{ post :create, params: { topic_id: my_topic.id, post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)

      end

 # #5
      it "assigns the new post to @post" do
        # post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }

        # #22
       post :create, params: { topic_id: my_topic.id, post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }

        expect(assigns(:post)).to eq Post.last
      end

 # #6
      it "redirects to the new post" do
        # post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
        # expect(response).to redirect_to Post.last
        # #23
      post :create, params: { topic_id: my_topic.id, post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
# #24
      expect(response).to redirect_to [my_topic, Post.last]

      end
    end

    # At #21, #22, and #23 we update the post :create request to include the id of the parent topic.
    #
    # At #24, because the route for the posts show view will also be updated to
    # reflect nested posts, instead of redirecting to Post.last, we redirect to
    # [my_topic, Post.last]. Rails' router can take an array of objects and build a
    # route to the show page of the last object in the array, nesting it under the other objects in the array.

    describe "GET show" do
         it "returns http success" do
     # #16
          #  get :show, params: { id: my_post.id }
          # #15
       get :show, params: { topic_id: my_topic.id, id: my_post.id }

           expect(response).to have_http_status(:success)
         end
         it "renders the #show view" do
     # #17
          #  get :show, params: { id: my_post.id }
          # #16
      get :show, params: { topic_id: my_topic.id, id: my_post.id }

           expect(response).to render_template :show
         end

         it "assigns my_post to @post" do
          #  get :show, params: { id: my_post.id }
          # #17
      get :show, params: { topic_id: my_topic.id, id: my_post.id }
     # #18
           expect(assigns(:post)).to eq(my_post)
         end
       end


      #  Posts routes will now include the topic_id of the parent topic, so at
      #  #15, #16, and #17 we update our get :show request to include the id of the parent topic.


       describe "GET edit" do
         it "returns http success" do
          #  get :edit, params: { id: my_post.id }
          # #25
       get :edit, params: { topic_id: my_topic.id, id: my_post.id }

           expect(response).to have_http_status(:success)
         end

         it "renders the #edit view" do
          #  get :edit, params: { id: my_post.id }
          # #26
      get :edit, params: { topic_id: my_topic.id, id: my_post.id }
    #1
           expect(response).to render_template :edit
         end

         #2
         it "assigns post to be updated to @post" do
      #  get :edit, params: { id: my_post.id }
      # #27
       get :edit, params: { topic_id: my_topic.id, id: my_post.id }


       post_instance = assigns(:post)

       expect(post_instance.id).to eq my_post.id
       expect(post_instance.title).to eq my_post.title
       expect(post_instance.body).to eq my_post.body
       end
     end


#At #25, #26, and #27 we update the get :edit request to include the id of the parent topic.


     describe "PUT update" do
       it "updates posts with expected attributes" do
         new_title = RandomData.random_sentence
         new_body = RandomData.random_paragraph

        #  put :update, params: { id: my_post.id, post: {title: new_title, body: new_body}}
        # #28
       put :update, params: { topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body } }
   #3

         updated_post = assigns(:post)
         expect(updated_post.id).to eq my_post.id
          expect(updated_post.title).to eq new_title
           expect(updated_post.body).to eq new_body
         end
         it "redirects to the updated post" do
       new_title = RandomData.random_sentence
       new_body = RandomData.random_paragraph

 # #4
      #  put :update, params: { id: my_post.id, post: {title: new_title, body: new_body } }
      #  expect(response).to redirect_to my_post

      # #29
      put :update, params: { topic_id: my_topic.id, id: my_post.id, post: {title: new_title, body: new_body } }
# #30
      expect(response).to redirect_to [my_topic, my_post]
           end
     end

#At #28 and #29 we update the put :update request to include the id of the parent topic.

#At #30, we replace redirect_to my_post with redirect_to [my_topic, my_post] so
#that we'll be redirected to the posts show view after we nest posts.

     describe "DELETE destroy" do
     it "deletes the post" do
      #  delete :destroy, params: { id: my_post.id }

 # #6
 # #31
      delete :destroy, params: { topic_id: my_topic.id, id: my_post.id }

       count = Post.where({id: my_post.id}).size
       expect(count).to eq 0
     end

 #     it "redirects to posts index" do
 #       delete :destroy, params: { id: my_post.id }
 # # #7
 #       expect(response).to redirect_to posts_path
 it "redirects to topic show" do
# #32
   delete :destroy, params: { topic_id: my_topic.id, id: my_post.id }
# #33
   expect(response).to redirect_to my_topic

     end
   end
#At #31 and #32 we update the delete :destroy request to include the id of the parent topic.

#At #33, we want to be redirected to the topics show view instead of the posts index



##  describe "GET #show" do
  ##  it "returns http success" do
  ##    get :show
  ##    expect(response).to have_http_status(:success)
  ##  end
##  end

##  describe "GET #new" do
##    it "returns http success" do
  ##    get :new
  ##    expect(response).to have_http_status(:success)
  ##  end
##  end

##  describe "GET #edit" do
##    it "returns http success" do
##      get :edit
  ##    expect(response).to have_http_status(:success)
  ##  end
  ## end

end
##At #6, RSpec created a test for PostsController. type: :controller tells RSpec to treat
##the test as a controller test. This allows us to simulate controller actions such as HTTP requests.

##At #7, the test performs a GET on the index view and expects the response to be successful.
##have_http_status is an RSpec matcher which encapsulates this logic.  have_http_status(:success)
## checks for a response code of 200, which is the standard HTTP response code for success.


#There are separate new and create sections at #1 and #4. When new is invoked, a new and unsaved Post object is
#created. When create is invoked, the newly created object is persisted to the database.
#At #2, we expect PostsController#new to render the posts new view. We use the  render_template method to verify that the correct template (view) is rendered.

#At #3, we expect the @post instance variable to be initialized by  PostsController#new. assigns gives us access to the @post variable, assigning it to :post.

#At #4, we expect that after PostsController#create is called with the parameters  {post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}, the count of Post instances (i.e. rows in the posts table) in the database will increase by one.

#At #5, when create is POSTed to, we expect the newly created post to be assigned to @post.

#At #6, we expect to be redirected to the newly created post.

#At #16, we pass {id: my_post.id} to show as a parameter. These parameters are passed to the  params hash.

#The params hash contains all parameters passed to the application's controller (application_controller.rb), whether
 #from GET, POST, or any other HTTP action.

#At #17, we expect the response to return the show view using the  render_template matcher.

#At #18, we expect the post to equal my_post because we call show with the id of  my_post. We are testing that
 #the post returned to us is the post we asked for.

 #At #1, we expect the edit view to render when a post is edited.

#At #2, we test that edit assigns the correct post to be updated to @post.
#At #3, we test that @post was updated with the title and body passed to update. We also test that @post's id was not changed.

#At #6, we search the database for a post with an id equal to my_post.id. This returns an Array. We assign the size of
#the array to count, and we expect count to equal zero. This test asserts that the database won't have a matching post after  destroy is called.

#At #7, we expect to be redirected to the posts index view after a post has been deleted.






#At #4, we expect to be redirected to the posts show view after the update.
