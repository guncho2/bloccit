class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
   # #9
       @user = User.new
       @user.name = params[:user][:name]
       @user.email = params[:user][:email]
       @user.password = params[:user][:password]
       @user.password_confirmation = params[:user][:password_confirmation]

   # #10
       if @user.save
         flash[:notice] = "Welcome to Bloccit #{@user.name}!"
         redirect_to root_path
       else
         flash.now[:alert] = "There was an error creating your account. Please try again."
         render :new
       end
     end


end


# At #9, we create a new user with new and then set the corresponding attributes from the params hash.
#
# At #10, we save the new user to the database. If the database save is successful, we add a flash
# message and then redirect the user to the root path. Otherwise, we display an error and render the new view.
