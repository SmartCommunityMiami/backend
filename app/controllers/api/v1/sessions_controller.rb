class Api::V1::SessionsController < Api::ApiController
	skip_before_action :verify_authenticity_token
	before_filter :authenticate_with_token!, only: [:destroy]
	respond_to :json

	def create
		user = User.find_by(username: params[:session][:username].downcase)
		if user && user.valid_password?(params[:password])
			user.generate_authentication_token!
			user.save
			render user, status: :created
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end

	def destroy
		if current_user
			current_user.auth_token = "";
			current_user.save
			head :no_content
		else
			render status: :unprocessable_entity
		end
	end

	private
		def vote_params
			params.require(:session).permit(:username, :password)
		end
end 
