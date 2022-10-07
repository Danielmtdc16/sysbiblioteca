class LivroLeitor < ApplicationRecord
  belongs_to :user
  belongs_to :livro
  belongs_to :leitor

  validates :data_inicio, :status, presence: true

  validate :validate_update_reserva, on: :update

  def validate_update_reserva
    if self.status == "Entregue" and self.data_entrega == nil
        errors.add(:data_entrega, ": para status de entregue a data de entrega é obrigatória")
    end
    if (self.data_inicio != nil and self.data_entrega != nil) and 
      self.data_inicio > self.data_entrega
      errors.add(:data_entrega, ": para não pode ser menor que data inicio")
    end
  end 
end
