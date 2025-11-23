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

#CREATE TABLE "cliente_roteiros" (
#  "id" BIGSERIAL PRIMARY KEY,
#  "data_compra" timestamp,
#  "cliente_id" bigint NOT NULL,
#  "roteiro_id" bigint NOT NULL,
#  "created_at" timestamp(6) NOT NULL,
#  "updated_at" timestamp(6) NOT NULL
#);
#
#ALTER TABLE "cliente_roteiros"
#ADD CONSTRAINT "fk_rails_cliente"
#FOREIGN KEY ("cliente_id")
#REFERENCES "clientes" ("id");
#
#ALTER TABLE "cliente_roteiros"
#ADD CONSTRAINT "fk_rails_roteiro"
#FOREIGN KEY ("roteiro_id")
#REFERENCES "roteiros" ("id");
