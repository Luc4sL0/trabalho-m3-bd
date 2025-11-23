class CreateFormaPagamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :forma_pagamentos do |t|
      t.string :tipo, limit: 20, null: false

      t.timestamps
    end
  end
end
