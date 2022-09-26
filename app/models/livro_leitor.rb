class LivroLeitor < ApplicationRecord
  belongs_to :user
  belongs_to :livro
  belongs_to :leitor
end
