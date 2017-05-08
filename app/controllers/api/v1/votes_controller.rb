class Api::V1::VotesController < Api::ApiController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_with_token!, only: [:create, :destroy]
  before_action :set_vote, only: [:show, :destroy]
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
    @vote = Vote.find_or_initialize_by(vote_params.except(:direction))
    @vote.user = current_user
    @vote.direction = params[:vote][:direction]
    if @vote.id == nil and @vote.save
      render :show, status: :created, location: api_vote_url(@vote)
    elsif @vote.id and @vote.save
      render :show, status: :ok, location: api_vote_url(@vote)
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
