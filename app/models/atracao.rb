class Atracao < ApplicationRecord
  self.table_name = "atracoes"

  belongs_to :localidade
  
  has_many :dia_atracoes, class_name: "DiaAtracao", dependent: :destroy
end
