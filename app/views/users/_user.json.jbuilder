json.extract! user, :id, :nome, :telefone, :created_at, :updated_at
json.url user_url(user, format: :json)
