require 'rails_helper'

describe Api::V1::IssuesController do
  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
    @user = FactoryGirl.create :user
    @user.generate_authentication_token!
  end

  describe "GET #index" do
    before(:each) do 
      @issue = FactoryGirl.create :issue
      get :index
    end

    it { should respond_with 200 }
  end

  describe "GET #show" do
    before(:each) do 
      @issue = FactoryGirl.create :issue
      get :show, params: { id: @issue.id }
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
        @issue_attributes = FactoryGirl.build(:issue).attributes
        post :create, params: { issue: @issue_attributes }
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        # not including the department
        @invalid_issue_attributes = FactoryGirl.attributes_for :issue
        post :create, params: { issue: @invalid_issue_attributes }
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @issue = FactoryGirl.create :issue
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, params: { id: @issue.id, issue: { phone: "1234567890" } }
      end

      it { should respond_with 200 }
    end

    context "when is not updated" do
      before(:each) do
        patch :update, params: { id: @issue.id, issue: { description: nil } }
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @issue = FactoryGirl.create :issue      
      delete :destroy, params: { id: @issue.id }
    end

    it { should respond_with 204 }

  end
end
