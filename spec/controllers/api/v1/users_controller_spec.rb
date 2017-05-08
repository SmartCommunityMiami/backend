require 'rails_helper'

describe Api::V1::UsersController do
  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
 end

  describe "GET #index" do
    before(:each) do 
      @user = FactoryGirl.create :user
      get :index
    end

    it { should respond_with 200 }
  end



  describe "GET #show" do
    before(:each) do 
      @user = FactoryGirl.create :user
      get :show, params: { id: @user.id }
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, params: { user: @user_attributes }
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_user_attributes = { password: "12345678", password_confirmation: "12345678" } #notice I'm not including the email
        post :create, params: { user: @invalid_user_attributes }
      end

      it { should respond_with 422 }
    end
  end

end
