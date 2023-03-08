json.extract! person, :id, :name, :email, :telephone, :created_at, :updated_at
json.url person_url(person, format: :json)
