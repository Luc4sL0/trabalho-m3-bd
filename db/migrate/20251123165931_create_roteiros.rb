class CreateRoteiros < ActiveRecord::Migration[7.2]
  def change
    create_table :roteiros do |t|
      t.string :nome, limit: 200
      t.text :descricao
      t.float :preco, null: false
      t.references :forma_pagamento, null: false, foreign_key: true

      t.timestamps
    end
  end
end

#CREATE TABLE "roteiros" (
#  "id" BIGSERIAL PRIMARY KEY,
#  "nome" VARCHAR(200),
#  "descricao" TEXT,
#  "preco" double precision NOT NULL,
#  "forma_pagamento_id" bigint NOT NULL,
#  "created_at" TIMESTAMP(6) NOT NULL,
#  "updated_at" TIMESTAMP(6) NOT NULL
#);

#ALTER TABLE "roteiros"
#ADD CONSTRAINT "fk_rails_forma_pagamento"
#FOREIGN KEY ("forma_pagamento_id")
#REFERENCES "forma_pagamentos"("id");

