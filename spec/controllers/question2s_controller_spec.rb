require 'rails_helper'
include RandomData


RSpec.describe Question2sController, type: :controller do
  let (:my_question2) do
    Question2.create(
    id: 1,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    resolved: false
  )
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns my_question2 to @question2" do
      get :index
      expect(assigns(:question2s)).to eq([my_question2])

    end
  end


  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: my_question2.id }
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do

      get :show, params: { id: my_question2.id }
      expect(response).to render_template :show
    end

    it "assigns [my_question2] to @question2" do
      get :show, params: { id: my_question2.id }

      expect(assigns(:question2)).to eq(my_question2)
    end
  end


  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end
  #3
    it "instantiates @question2" do
      get :new
      expect(assigns(:question2)).not_to be_nil
    end
  end

  describe "POST create" do
   # #4
        it "increases the number of Question2 by 1" do
          expect{ post :create, params: { question2: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Question2,:count).by(1)
        end

   # #5
        it "assigns the new question2 to @question2" do
          post :create, params: { question2: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
          expect(assigns(:question2)).to eq Question2.last
        end

   # #6
        it "redirects to the new question2" do
          post :create, params: { question2: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
          expect(response).to redirect_to Question2.last
        end
      end


  #
  describe "GET edit" do
    it "returns http success" do
      get :edit, params: { id: my_question2.id }
      expect(response).to have_http_status(:success)
    end
    it "renders the #edit view" do
      get :edit, params: { id: my_question2.id }
      #1
      expect(response).to render_template :edit
    end
  end

  describe "DELETE destroy" do
  it "deletes the question2" do
    delete :destroy, params: { id: my_question2.id }
 # #6
    count = Question2.where({id: my_question2.id}).size
    expect(count).to eq 0
  end

  it "redirects to question2s index" do
    delete :destroy, params: { id: my_question2.id }
 # #7
    expect(response).to redirect_to question2_path
  end
 end

  describe "PUT update" do
    it "updates question2 with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, params: { id: my_question2.id, question2: {title: new_title, body: new_body, resolved: false}}

      #3

      updated_question2 = assigns(:question2)
      expect(updated_question2.id).to eq my_question2.id
       expect(updated_question2.title).to eq new_title
        expect(updated_question2.body).to eq new_body
      end
      it "redirects to the updated question2" do
    new_title = RandomData.random_sentence
    new_body = RandomData.random_paragraph

# #4
    put :update, params: { id: my_question2.id, question2: {title: new_title, body: new_body } }
    expect(response).to redirect_to my_question2


    end
  end


end
