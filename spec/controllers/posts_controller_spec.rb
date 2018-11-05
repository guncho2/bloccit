require 'rails_helper'
 # #6
RSpec.describe PostsController, type: :controller do

  # #8
   let(:my_post) { Post.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }


  describe "GET #index" do
    it "returns http success" do
       # #7
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns [my_post] to @posts" do
  get :index
# #9
  expect(assigns(:posts)).to eq([my_post])
end
  end

#1
describe "GET new" do
  it "returns http success" do
    get :new
    expect(response).to have_http_status(:success)
  end
#2
  it "renders the #new view" do
    get :new
    expect(response).to render_template :new
  end
#3
  it "instantiates @post" do
    get :new
    expect(assigns(:post)).not_to be_nil
  end
end

describe "POST create" do
 # #4
      it "increases the number of Post by 1" do
        expect{ post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)
      end

 # #5
      it "assigns the new post to @post" do
        post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
        expect(assigns(:post)).to eq Post.last
      end

 # #6
      it "redirects to the new post" do
        post :create, params: { post: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
        expect(response).to redirect_to Post.last
      end
    end

    describe "GET show" do
         it "returns http success" do
     # #16
           get :show, params: { id: my_post.id }
           expect(response).to have_http_status(:success)
         end
         it "renders the #show view" do
     # #17
           get :show, params: { id: my_post.id }
           expect(response).to render_template :show
         end

         it "assigns my_post to @post" do
           get :show, params: { id: my_post.id }
     # #18
           expect(assigns(:post)).to eq(my_post)
         end
       end

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
