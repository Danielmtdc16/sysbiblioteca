require "date"
class LivroLeitor < ApplicationRecord
  belongs_to :user
  belongs_to :livro
  belongs_to :leitor

  validates :data_inicio, :status, presence: true

  validate :validate_update_reserva, on: :update

  before_create :salve_reserva

  def salve_reserva
    configuracao = ConfiguracoesSistema.find(1)
    self.data_possivel_entrega = Date.current + configuracao.prazo_dias.day
    dias = configuracao.prazo_dias
    data_final = Date.current + configuracao.prazo_dias.day
    data_inicial = Date.current
    begin
      dias = dias+ (dias - dias_uteis(data_inicial, (Date.current + dias)))
    end while configuracao.prazo_dias>=dias

    self.data_possivel_entrega = (Date.current + dias)

  end


  def validate_update_reserva
    if self.status == "Entregue" and self.data_entrega == nil
        errors.add(:data_entrega, ": é obrigatória para status de entregue")
    end
    if (self.data_inicio != nil and self.data_entrega != nil) and 
      self.data_inicio > self.data_entrega
      errors.add(:data_entrega, ": não pode ser menor que data inicio")
    end
  end 

  def calcular_multa(valor_multa_diaria)
    qtd_dias = (Date.current.to_date - self.data_possivel_entrega.to_date).to_i
    if qtd_dias > 0
      return qtd_dias * valor_multa_diaria
    end
    return 0
  end
end
