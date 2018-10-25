require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do

  describe "GET index" do
    it "renders the index template" do
# #2
      get :index
# #3
      expect(response).to render_template("index")
    end
  end


    describe "GET about" do
      it "renders the about template" do
        get :about
        expect(response).to render_template("about")
      end
    end

    describe "GET faq" do
      it "renders the faq template" do
        get :faq
        expect(response).to render_template("faq")
      end
    end

end
#At #1, we describe the subject of the spec, WelcomeController.
#We use get, at #2, to call the index method of WelcomeController.
#At #3, we expect the controller's response to render the index template.
