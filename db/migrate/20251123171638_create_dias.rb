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

#CREATE TABLE "dias" (
#  "id" BIGSERIAL PRIMARY KEY,
#  "numero_dia" integer NOT NULL,
#  "descricao" TEXT,
#  "roteiro_id" bigint NOT NULL,
#  "created_at" TIMESTAMP(6) NOT NULL,
#  "updated_at" TIMESTAMP(6) NOT NULL
#);
#
#ALTER TABLE "dias"
#ADD CONSTRAINT "fk_rails_roteiro"
#FOREIGN KEY ("roteiro_id")
#REFERENCES "roteiros"("id");
