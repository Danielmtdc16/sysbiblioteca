class Livro < ApplicationRecord
  has_many :livro_leitors, inverse_of: :livro, dependent: :destroy
  belongs_to :editora
  belongs_to :categore
end
