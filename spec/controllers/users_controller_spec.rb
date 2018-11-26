require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # #1
   let(:new_user_attributes) do
     {
         name: "BlocHead",
         email: "blochead@bloc.io",
         password: "blochead",
         password_confirmation: "blochead"
     }
   end

   # #2
      describe "GET new" do
        it "returns http success" do
          get :new
          expect(response).to have_http_status(:success)
        end

        it "instantiates a new user" do
          get :new
          expect(assigns(:user)).to_not be_nil
        end
      end


end


#At #1, we create a hash of attributes named new_user_attributes so we can use them easily throughout our spec.
#At #2, we test the new action for HTTP success when issuing a GET. The first test expects the response to
 #return an HTTP response code of 200. The second test expects new to instantiate a new user.
