class ConfiguracoesSistema < ApplicationRecord
    validates :nome_sistema, :prazo_dias, :valor_multa, :ativar_multa, presence:true
end
