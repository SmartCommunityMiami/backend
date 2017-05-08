require 'rails_helper'

describe Api::V1::ReportsController do
  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
    @user = FactoryGirl.create :user
    @user.generate_authentication_token!
  end

  describe "GET #index" do
    before(:each) do 
      @report = FactoryGirl.create :report
      get :index
    end

    it { should respond_with 200 }
  end

  describe "GET #show" do
    before(:each) do 
      @report = FactoryGirl.create :report
      get :show, params: { id: @report.id }
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
        @report_attributes = FactoryGirl.build(:report).attributes
        post :create, params: { report: @report_attributes }
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        # not including user or issue
        @invalid_report_attributes = FactoryGirl.attributes_for :report
        post :create, params: { report: @invalid_report_attributes }
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @report = FactoryGirl.create :report
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, params: { id: @report.id, report: { phone: "1234567890" } }
      end

      it { should respond_with 200 }
    end

    context "when is not updated" do
      before(:each) do
        patch :update, params: { id: @report.id, report: { description: nil } }
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @report = FactoryGirl.create :report      
      delete :destroy, params: { id: @report.id }
    end

    it { should respond_with 204 }
  end
end
