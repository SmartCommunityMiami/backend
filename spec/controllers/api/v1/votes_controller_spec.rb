require 'rails_helper'

describe Api::V1::VotesController do
  before(:each) do
    request.env["HTTP_ACCEPT"] = 'application/json'
    @user = FactoryGirl.create :user
    @user.generate_authentication_token!
  end

  describe "GET #index" do
    before(:each) do 
      @vote = FactoryGirl.create :vote
      get :index
    end

    it { should respond_with 200 }
  end

  describe "GET #show" do
    before(:each) do 
      @vote = FactoryGirl.create :vote
      get :show, params: { id: @vote.id }
    end

    it { should respond_with 200 }
  end

  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
        @vote_attributes = FactoryGirl.build(:vote).attributes
        post :create, params: { vote: @vote_attributes }
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        # not including user or report
        @invalid_vote_attributes = FactoryGirl.attributes_for :vote
        post :create, params: { vote: @invalid_vote_attributes }
    end

      it { should respond_with 422 }
    end


    context "when is successfully updated" do
      before(:each) do
        @vote = FactoryGirl.create :vote
        post :create, params: { vote: @vote.attributes }
      end

      it { should respond_with 200 }
    end

    context "when is not updated" do
      before(:each) do
        @vote = FactoryGirl.create :vote
        @vote_attributes = @vote.attributes
        @vote_attributes['direction'] = -2
        post :create, params: { vote: @vote_attributes }
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @vote = FactoryGirl.build :vote
      @vote.user = @user
      @vote.save      
      delete :destroy, params: { id: @vote.id }
    end

    it { should respond_with 204 }
  end
end
