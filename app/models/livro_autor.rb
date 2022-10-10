class LivroAutor < ApplicationRecord
  belongs_to :livro
  belongs_to :autor
  attr_accessor :nome_autor

  validates :autor_id, uniqueness: { scope: :livro_id, message: " duplicado em livro" }

  after_find do |autor|
    autor = Autor.find(self.autor_id)
    self.nome_autor = autor.nome
  end
end
