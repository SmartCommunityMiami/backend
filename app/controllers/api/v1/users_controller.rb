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

  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      render :show, status: :created, location: api_user_url(@user)
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :first_name, :last_name, :password)
    end

end