class Leitor < ApplicationRecord
    has_many :livro_leitors, inverse_of: :leitor, dependent: :destroy
    validates :nome, :cpf, :telefone, :email, :tipo_leitor, :matricula, presence: true
end
