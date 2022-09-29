class LivroLeitor < ApplicationRecord
  belongs_to :user
  belongs_to :livro
  belongs_to :leitor

  validates :data_inicio, :data_entrega, :data_possivel_entrega, :status, presence: true
end
