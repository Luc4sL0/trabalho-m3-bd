class CreateDias < ActiveRecord::Migration[7.2]
  def change
    create_table :dias do |t|
      t.integer :numero_dia, null: false
      t.text :descricao
      t.references :roteiro, null: false, foreign_key: true

      t.timestamps
    end
  end
end
