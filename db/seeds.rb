# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(nome: 'aluno', telefone: '1111', email: 'exemplo@gmail.com', password: '12345678')
ConfiguracoesSistema.create(nome_sistema: 'SysBiblioteca', prazo_dias: 10, valor_multa: 5, ativar_multa: 0)
Autor.create(nome: 'Jorge Amado')
Categore.create(nome: 'Ficção Científica')
Leitor.create(nome: 'Daniel', cpf: '12312312312', telefone: '89981379720', email: 'daniel@gmail.com', tipo_leitor: 'Aluno', matricula: '123456')
Editora.create(nome: 'Saraiva')
Livro.create(nome: 'adsa', edicao: '3', qtd_paginas: 300, qtd_livros: 10, descricao: 'Livro Bom', editora_id: 1, categore_id: 1)
Livro_autor.create(livro_id: 1, autor_id: 1)

