class User < ApplicationRecord
    validates :nome, :telefone, presence: true
end
