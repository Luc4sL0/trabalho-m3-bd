class DiaAtracao < ApplicationRecord
  self.table_name = "dia_atracoes"
  
  belongs_to :dia
  belongs_to :atracao
end
