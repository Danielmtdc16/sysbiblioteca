class CreateLivros < ActiveRecord::Migration[6.1]
  def change
    create_table :livros do |t|
      t.string :nome
      t.string :edicao
      t.integer :qtd_paginas
      t.integer :qtd_livros
      t.text :descricao
      t.references :editora, null: false, foreign_key: true
      t.references :categore, null: false, foreign_key: true

      t.timestamps
    end
  end
end
