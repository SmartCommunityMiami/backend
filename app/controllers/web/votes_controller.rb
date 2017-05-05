class Web::VotesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  layout 'web/layouts/application'
  respond_to :html

  # GET /votes
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  def create
    if user_signed_in?
      @vote = Vote.new(vote_params)
      if @vote.save
        redirect_to web_vote_path(@vote), notice: 'Vote was successfully created.'
      else
        render :new
      end
    end
  end

  # PATCH/PUT /votes/1
  def update
    if user_signed_in?
      if @vote.update(vote_params)
        redirect_to web_vote_path(@vote), notice: 'Vote was successfully updated.'
      else
        render :edit
      end
    end
  end

  # DELETE /votes/1
  def destroy
    if user_signed_in?
      @vote.destroy
      redirect_to web_votes_url, notice: 'Vote was successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:report_id, :user_id, :direction)
    end
end
