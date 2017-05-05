class Api::V1::VotesController < Api::ApiController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_with_token!, only: [:create, :update, :destroy]
  before_action :set_vote, only: [:show, :update, :destroy]
  respond_to :json

  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1.json
  def show
  end

  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)
    @vote.user = current_user
    if @vote.save
      render :show, status: :created, location: api_vote_url(@vote)
    else
      @vote = Vote.find_by(user_id: current_user.id, report_id: params[:vote][:report_id])
      @vote.direction = params[:vote][:direction]
      if @vote.save
        render :show, status: :created, location: api_vote_url(@vote)
      else
        render json: @vote.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /votes/1.json
  def update
    if current_user == @vote.user then
      if @vote.update(vote_params)
        render :show, status: :ok, location: api_vote_url(@vote)
      else
        render json: @vote.errors, status: :unprocessable_entity
      end
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1.json
  def destroy
    if current_user == @vote.user then
      @vote.destroy
      head :no_content 
    else
      render json: @vote.errors, status: :unprocessable_entity
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
