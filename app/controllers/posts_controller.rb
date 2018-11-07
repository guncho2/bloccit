class PostsController < ApplicationController
  def index

    # #11
    @posts = Post.all
    @posts.each_with_index do |post, index|
      if index % 5 == 0
        post.title = "SPAM!!!"
      end
    end

  end

  def show
    # #19
    @post = Post.find(params[:id])
  end

  def new
    #7
    @post = Post.new
  end


  def create
   # #9
       @post = Post.new
       @post.title = params[:post][:title]
       @post.body = params[:post][:body]

   # #10
       if @post.save
   # #11
         flash[:notice] = "Post was saved."
         redirect_to @post
       else
   # #12
         flash.now[:alert] = "There was an error saving the post. Please try again."
         render :new
       end
     end
     def update
          @post = Post.find(params[:id])
          @post.title = params[:post][:title]
          @post.body = params[:post][:body]

          if @post.save
            flash[:notice] = "Post was updated."
            redirect_to @post
          else
            flash.now[:alert] = "There was an error saving the post. Please try again."
            render :edit
          end
        end



        def destroy
     @post = Post.find(params[:id])

 # #8
     if @post.destroy
       flash[:notice] = "\"#{@post.title}\" was deleted successfully."
       redirect_to posts_path
     else
       flash.now[:alert] = "There was an error deleting the post."
       render :show
     end
   end



  def edit
     @post = Post.find(params[:id])
  end
end


#At #11, we declare an instance variable @posts and assign it a collection of
#Post objects using the all method provided by ActiveRecord. all returns a collection of Post objects.
#At #7, we create an instance variable, @post, then assign it an empty post returned by Post.new.

#At #9, we call Post.new to create a new instance of Post.

#At #10, if we successfully save Post to the database, we display a success message using flash[:notice] and redirect the user to the route generated by @post. Redirecting to @post will direct the user to the posts show view.

#At #11, we assign a value to flash[:notice]. The flash hash provides a way to pass temporary values between actions. Any value placed in flash will be available in the next action and then deleted.

#At #12, if we do not successfully save Post to the database, we display an error message and render the new view again.

#When the user clicks Save, the create method is called. create either updates the database with the save method,
# or returns an error. Unlike new, create does not have a corresponding view. create works behind the scenes to collect
#the data submitted by the user and update the database. create is a POST action.




#At #8, we call destroy on @post. If that call is successful, we set a flash message and redirect the user
# to the posts index view. If destroy fails then we redirect the user to the show view using render :show.



#At #19, we find the post that corresponds to the id in the params that was passed to  show and assign it
#to @post. Unlike in the index method, in the show method, we populate an instance variable with a single post,
# rather than a collection of posts.
