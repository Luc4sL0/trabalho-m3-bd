class CreateLocalidades < ActiveRecord::Migration[7.2]
  def change
    create_table :localidades do |t|
      t.text :endereco, null: false
      t.references :pais, null: false, foreign_key: {to_table: :paises}

      t.timestamps
    end
  end
end

#CREATE TABLE "localidades" (
#  "id" BIGSERIAL PRIMARY KEY,
#  "endereco" TEXT NOT NULL,
#  "pais_id" bigint NOT NULL,
#  "created_at" TIMESTAMP(6) NOT NULL,
#  "updated_at" TIMESTAMP(6) NOT NULL
#);
#
#ALTER TABLE "localidades"
#ADD CONSTRAINT "fk_rails_localidades_pais"
#FOREIGN KEY ("pais_id")
#REFERENCES "paises"("id");
