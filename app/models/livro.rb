class Livro < ApplicationRecord
  belongs_to :editora
  belongs_to :categore
end
