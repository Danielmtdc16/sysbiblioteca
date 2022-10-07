class Livro < ApplicationRecord
  belongs_to :editora
  belongs_to :categore
  
  has_many :livro_leitors, inverse_of: :livro, dependent: :destroy
  has_many :livro_autors, inverse_of: :livro, dependent: :destroy
  accepts_nested_attributes_for :livro_autors, reject_if: :all_blank, allow_destroy: true
  
end
