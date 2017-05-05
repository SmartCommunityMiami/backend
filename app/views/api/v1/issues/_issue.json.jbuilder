json.extract! issue, :id, :description, :department, :created_at, :updated_at
json.url api_issue_url(issue, format: :json)
