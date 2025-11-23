class CreateDiaAtracoes < ActiveRecord::Migration[7.2]
  def change
    create_table :dia_atracoes do |t|
      t.references :dia, null: false, foreign_key: { to_table: :dias }
      t.references :atracao, null: false, foreign_key: { to_table: :atracoes }

      t.timestamps
    end
  end
end

#CREATE TABLE "dia_atracoes" (
#  "id" BIGSERIAL PRIMARY KEY,
#  "dia_id" bigint NOT NULL,
#  "atracao_id" bigint NOT NULL,
#  "created_at" TIMESTAMP(6) NOT NULL,
#  "updated_at" TIMESTAMP(6) NOT NULL
#);
#
#ALTER TABLE "dia_atracoes"
#ADD CONSTRAINT "fk_rails_dia"
#FOREIGN KEY ("dia_id")
#REFERENCES "dias"("id");
#
#ALTER TABLE "dia_atracoes"
#ADD CONSTRAINT "fk_rails_atracao"
#FOREIGN KEY ("atracao_id")
#REFERENCES "atracoes"("id");
