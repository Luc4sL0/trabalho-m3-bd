class Roteiro < ApplicationRecord
  self.table_name = "roteiros"

  belongs_to :forma_pagamento
  has_many :cliente_roteiros
  has_many :dias
end
