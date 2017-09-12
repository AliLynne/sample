require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe "#index" do
    it "responds successfully" do
      get :index
      expect(response).to be_success
    end

    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "tasks#new action" do
    it "should successfully show the new form" do
      user = FactoryGirl.build(:user)
      sign_in user
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "tasks#create action" do
    it "should successfully create a new task in our database" do
      user = FactoryGirl.build(:user)
      sign_in user

      post :create, params: { task: { title: 'Groceries'} }
      expect(response).to redirect_to root_path

      task = Task.last
      expect(task.title).to eq("Groceries")
       expect(task.user).to eq(user)
    end

    it "should properly deal with validation errors" do
      user = FactoryGirl.build(:user)
      sign_in user
      post :create, params: { task: { title: ''} }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Task.count).to eq 0
    end
  end
end
