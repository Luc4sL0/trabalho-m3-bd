class CreateDadoBancarios < ActiveRecord::Migration[7.2]
  def change
    create_table :dado_bancarios do |t|
      t.string :banco, limit: 100, null: false
      t.string :numero_conta, limit: 100, null: false
      t.string :agencia, limit: 100, null: false

      t.timestamps
    end

    add_index :dado_bancarios, :numero_conta, unique: true
  end
end

#CREATE TABLE "dado_bancarios" (
#  "id" BIGSERIAL PRIMARY KEY,
#  "banco" VARCHAR(100) NOT NULL,
#  "numero_conta" VARCHAR(100) NOT NULL,
#  "agencia" VARCHAR(100) NOT NULL,
#  "created_at" TIMESTAMP(6) NOT NULL,
#  "updated_at" TIMESTAMP(6) NOT NULL
#);

#CREATE UNIQUE INDEX "index_dado_bancarios_on_numero_conta"
#ON "dado_bancarios" ("numero_conta");

