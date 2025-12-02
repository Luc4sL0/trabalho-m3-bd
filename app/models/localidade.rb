class Localidade < ApplicationRecord
  self.table_name = "localidades"

  belongs_to :pais
  
  has_many :atracoes, dependent: :destroy 
end
