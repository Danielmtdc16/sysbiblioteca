json.extract! livro, :id, :nome, :edicao, :qtd_paginas, :qtd_livros, :descricao, :editora_id, :categore_id, :created_at, :updated_at
json.url livro_url(livro, format: :json)
