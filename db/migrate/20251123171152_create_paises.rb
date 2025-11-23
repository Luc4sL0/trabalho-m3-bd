class CreatePaises < ActiveRecord::Migration[7.2]
  def change
    create_table :paises do |t|
      t.string :nome, null: false
      
      t.timestamps
    end
    
    add_index :paises, :nome, unique: true
  end
end

#CREATE TABLE "paises" (
#  "id" BIGSERIAL PRIMARY KEY,
#  "nome" VARCHAR NOT NULL,
#  "created_at" TIMESTAMP(6) NOT NULL,
#  "updated_at" TIMESTAMP(6) NOT NULL
#);
#
#CREATE UNIQUE INDEX "index_paises_on_nome"
#ON "paises" ("nome");
