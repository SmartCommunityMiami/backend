json.extract! report, :id, :issue, :description, :user, :picture_link, :latitude, :longitude, :date_resolved, :created_at, :updated_at
json.url api_report_url(report, format: :json)
