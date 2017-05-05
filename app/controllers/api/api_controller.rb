class Api::ApiController < ApplicationController

	private
	  	# Devise methods overwrites
		def current_user
			if request.headers['Authorization'] != ""
					@current_user ||= User.find_by(auth_token: request.headers['Authorization'])
			end
		end
		
		def authenticate_with_token!
			render json: { errors: "Not authenticated" },
		    	status: :unauthorized unless current_user.present?
			end
		end