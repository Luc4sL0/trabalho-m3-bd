class CreateClienteRoteiros < ActiveRecord::Migration[7.2]
  def change
    create_table :cliente_roteiros do |t|
      t.datetime :data_compra
      t.references :cliente, null: false, foreign_key: true
      t.references :roteiro, null: false, foreign_key: true

      t.timestamps
    end
  end
end
