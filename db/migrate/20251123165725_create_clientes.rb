class CreateClientes < ActiveRecord::Migration[7.2]
  def change
    create_table :clientes do |t|
      t.string :nome, limit: 100, null: false
      t.string :email, limit: 200, null: false
      t.string :telefone, limit: 50, null: false
      t.string :documento, limit: 50, null: false
      
      t.references :dado_bancario, null: false, foreign_key: true

      t.timestamps
    end
      
    add_index :clientes, :email, unique: true
    add_index :clientes, :documento, unique: true
  end
end

#CREATE TABLE "clientes" (
#  "id" BIGSERIAL PRIMARY KEY,
#  "nome" VARCHAR(100) NOT NULL,
#  "email" VARCHAR(200) NOT NULL,
#  "telefone" VARCHAR(50) NOT NULL,
#  "documento" VARCHAR(50) NOT NULL,
#  "dado_bancario_id" bigint NOT NULL,
#  "created_at" TIMESTAMP(6) NOT NULL,
#  "updated_at" TIMESTAMP(6) NOT NULL
#);

#ALTER TABLE "clientes"
#ADD CONSTRAINT "fk_rails_dado_bancario"
#FOREIGN KEY ("dado_bancario_id")
#REFERENCES "dado_bancarios"("id");

#CREATE UNIQUE INDEX "index_clientes_on_email"
#ON "clientes" ("email");

#CREATE UNIQUE INDEX "index_clientes_on_documento"
#ON "clientes" ("documento");
