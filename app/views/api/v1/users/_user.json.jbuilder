json.extract! user, :id, :username, :first_name, :last_name, :auth_token, :email, :created_at, :updated_at
json.url api_users_url(user, format: :json)
