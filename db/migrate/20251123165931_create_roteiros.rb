class CreateRoteiros < ActiveRecord::Migration[7.2]
  def change
    create_table :roteiros do |t|
      t.string :nome, limit: 200
      t.text :descricao
      t.float :preco, null: false
      t.references :forma_pagamento, null: false, foreign_key: true

      t.timestamps
    end
  end
end
