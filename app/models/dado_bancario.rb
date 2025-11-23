class DadoBancario < ApplicationRecord
  self.table_name = "dado_bancarios"

  has_one :cliente
end
