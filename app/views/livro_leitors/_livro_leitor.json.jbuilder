json.extract! livro_leitor, :id, :data_inicio, :data_entrega, :data_possivel_entrega, :status, :observacao, :user_id, :livro_id, :leitor_id, :created_at, :updated_at
json.url livro_leitor_url(livro_leitor, format: :json)
