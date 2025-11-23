class ClienteRoteiro < ApplicationRecord
  self.table_name = "cliente_roteiros"

  belongs_to :cliente
  belongs_to :roteiro
end
