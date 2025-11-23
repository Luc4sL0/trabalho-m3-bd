class Dia < ApplicationRecord
  self.table_name = "dias"

  belongs_to :roteiro
  has_many :dias_atracoes, dependent: :destroy
end
