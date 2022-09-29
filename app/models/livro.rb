class Livro < ApplicationRecord
  belongs_to :editora
  belongs_to :categore
  
  has_many :livro_leitors, inverse_of: :livro, dependent: :destroy
  
end
