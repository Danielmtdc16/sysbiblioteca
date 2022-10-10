# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(nome: 'aluno', telefone: '1111', email: 'exemplo@gmail.com', password: '12345678')
ConfiguracoesSistema.create(nome_sistema: 'SysBiblioteca', prazo_dias: 10, valor_multa: 5)