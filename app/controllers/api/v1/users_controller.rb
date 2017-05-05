class Api::V1::UsersController < Api::ApiController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show]
  respond_to :json

  # GET /users.json
  def index
	@users = User.all
  end

  # GET /users/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

end