class CreateFormaPagamentos < ActiveRecord::Migration[7.2]
  def change
    create_table :forma_pagamentos do |t|
      t.string :tipo, limit: 20, null: false

      t.timestamps
    end
  end
end

#CREATE TABLE "forma_pagamentos" (
#  "id" BIGSERIAL PRIMARY KEY,
#  "tipo" VARCHAR(20) NOT NULL,
#  "created_at" TIMESTAMP(6) NOT NULL,
#  "updated_at" TIMESTAMP(6) NOT NULL
#);
