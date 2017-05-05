json.extract! department, :id, :name, :email, :phone, :organization, :created_at, :updated_at
json.url api_department_url(department, format: :json)
