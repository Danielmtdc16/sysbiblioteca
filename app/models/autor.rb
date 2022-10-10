class Autor < ApplicationRecord


    validates :nome, presence:true
    
    has_many :livro_autors, inverse_of: :professor, dependent: :destroy
    accepts_nested_attributes_for :livro_autors, reject_if: :all_blank, allow_destroy: true
    
end
