require 'rails_helper'

describe Api::V1::DepartmentsController do
  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
    @user = FactoryGirl.create :user
    @user.generate_authentication_token!
  end

  describe "GET #index" do
    before(:each) do 
      @department = FactoryGirl.create :department
      get :index
    end

    # it "returns the information about a reporter on a hash" do
    #   user_response = json_response[:user]
    #   expect(user_response[:email]).to eql @user.email
    # end

    # it "has the product ids as an embeded object" do
    #   user_response = json_response[:user]
    #   expect(user_response[:product_ids]).to eql []
    # end

    it { should respond_with 200 }
  end



  describe "GET #show" do
    before(:each) do 
      @department = FactoryGirl.create :department
      get :show, params: { id: @department.id }
    end

    # it "returns the information about a reporter on a hash" do
    #   user_response = json_response[:user]
    #   expect(user_response[:email]).to eql @user.email
    # end

    # it "has the product ids as an embeded object" do
    #   user_response = json_response[:user]
    #   expect(user_response[:product_ids]).to eql []
    # end

    it { should respond_with 200 }
  end

  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
        @department_attributes = FactoryGirl.attributes_for :department
        post :create, params: { department: @department_attributes }
      end

      # it "renders the json representation for the user record just created" do
      #   user_response = json_response[:user]
      #   expect(user_response[:email]).to eql @user_attributes[:email]
      # end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_department_attributes = { phone: "1234567890", email: "test@test.com" } #notice I'm not including the name
        post :create, params: { department: @invalid_department_attributes }
      end

      # it "renders an errors json" do
      #   user_response = json_response
      #   expect(user_response).to have_key(:errors)
      # end

      # it "renders the json errors on whye the user could not be created" do
      #   user_response = json_response
      #   expect(user_response[:errors][:email]).to include "can't be blank"
      # end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @department = FactoryGirl.create :department
      # api_authorization_header @user.auth_token 
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, params: { id: @department.id, department: { phone: "1234567890" } }
      end

  #     it "renders the json representation for the updated user" do
  #       user_response = json_response[:user]
  #       expect(user_response[:email]).to eql "newmail@example.com"
  #     end

      it { should respond_with 200 }
    end

    context "when is not updated" do
      before(:each) do
        patch :update, params: { id: @department.id, department: { name: nil } }
      end

  #     it "renders an errors json" do
  #       user_response = json_response
  #       expect(user_response).to have_key(:errors)
  #     end

  #     it "renders the json errors on whye the user could not be created" do
  #       user_response = json_response
  #       expect(user_response[:errors][:email]).to include "is invalid"
  #     end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @department = FactoryGirl.create :department      
      # api_authorization_header @user.auth_token 
      delete :destroy, params: { id: @department.id }
    end

    it { should respond_with 204 }

  end
end
