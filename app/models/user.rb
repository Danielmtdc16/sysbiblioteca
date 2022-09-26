class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :timeoutable,
         :recoverable, :rememberable, :validatable
    validates :nome, :telefone, presence: true
end
