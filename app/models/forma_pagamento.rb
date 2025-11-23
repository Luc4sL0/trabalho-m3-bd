class FormaPagamento < ApplicationRecord
  self.table_name = "forma_pagamentos"

  has_many :roteiros
end
