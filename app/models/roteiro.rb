class Roteiro < ApplicationRecord
  self.table_name = "roteiros"

  belongs_to :forma_pagamento
  
  has_many :cliente_roteiros, dependent: :destroy
  has_many :dias, dependent: :destroy
end
