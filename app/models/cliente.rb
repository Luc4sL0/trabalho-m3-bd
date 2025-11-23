class Cliente < ApplicationRecord
  self.table_name = "clientes"

  belongs_to :dado_bancario
  accepts_nested_attributes_for :dado_bancario, update_only: true

  has_many :cliente_roteiros, dependent: :destroy
end
