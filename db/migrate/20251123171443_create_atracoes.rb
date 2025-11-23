class CreateAtracoes < ActiveRecord::Migration[7.2]
  def change
    create_table :atracoes do |t|
      t.string :nome, null: false
      t.string :descricao
      t.references :localidade, null: false, foreign_key: true

      t.timestamps
    end
  end
end

#CREATE TABLE "atracoes" (
#  "id" BIGSERIAL PRIMARY KEY,
#  "nome" VARCHAR NOT NULL,
#  "descricao" VARCHAR,
#  "localidade_id" bigint NOT NULL,
#  "created_at" TIMESTAMP(6) NOT NULL,
#  "updated_at" TIMESTAMP(6) NOT NULL
#);
#
#ALTER TABLE "atracoes"
#ADD CONSTRAINT "fk_rails_localidade"
#FOREIGN KEY ("localidade_id")
#REFERENCES "localidades"("id");
