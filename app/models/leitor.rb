class Leitor < ApplicationRecord
    validates :nome, :cpf, :telefone, :email, :tipo_leitor, :matricula, presence: true
end
