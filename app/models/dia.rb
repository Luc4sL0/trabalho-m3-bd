class Dia < ApplicationRecord
  self.table_name = "dias"

  belongs_to :roteiro
  
  has_many :dias_atracoes, class_name: "DiaAtracao", dependent: :destroy
end
