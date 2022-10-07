class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def dias_uteis(data_inicial, data_final)
		dias = (data_final-data_inicial+1).to_i
		domingos = (data_inicial..data_final).group_by(&:wday)[0]
		sabados = (data_inicial..data_final).group_by(&:wday)[6]
		@diasuteis = dias-(domingos != nil ? domingos.length : 0)-(sabados != nil ? sabados.length : 0)
	end
end
