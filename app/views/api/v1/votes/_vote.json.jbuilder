json.extract! vote, :id, :report, :user, :direction, :created_at, :updated_at
json.url api_vote_url(vote, format: :json)
