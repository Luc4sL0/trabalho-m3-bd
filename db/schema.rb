# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_11_23_171739) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atracoes", force: :cascade do |t|
    t.string "nome", null: false
    t.string "descricao"
    t.bigint "localidade_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["localidade_id"], name: "index_atracoes_on_localidade_id"
  end

  create_table "cliente_roteiros", force: :cascade do |t|
    t.datetime "data_compra"
    t.bigint "cliente_id", null: false
    t.bigint "roteiro_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_cliente_roteiros_on_cliente_id"
    t.index ["roteiro_id"], name: "index_cliente_roteiros_on_roteiro_id"
  end

  create_table "clientes", force: :cascade do |t|
    t.string "nome", limit: 100, null: false
    t.string "email", limit: 200, null: false
    t.string "telefone", limit: 50, null: false
    t.string "documento", limit: 50, null: false
    t.bigint "dado_bancario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dado_bancario_id"], name: "index_clientes_on_dado_bancario_id"
    t.index ["documento"], name: "index_clientes_on_documento", unique: true
    t.index ["email"], name: "index_clientes_on_email", unique: true
  end

  create_table "dado_bancarios", force: :cascade do |t|
    t.string "banco", limit: 100, null: false
    t.string "numero_conta", limit: 100, null: false
    t.string "agencia", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["numero_conta"], name: "index_dado_bancarios_on_numero_conta", unique: true
  end

  create_table "dia_atracoes", force: :cascade do |t|
    t.bigint "dia_id", null: false
    t.bigint "atracao_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atracao_id"], name: "index_dia_atracoes_on_atracao_id"
    t.index ["dia_id"], name: "index_dia_atracoes_on_dia_id"
  end

  create_table "dias", force: :cascade do |t|
    t.integer "numero_dia", null: false
    t.text "descricao"
    t.bigint "roteiro_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roteiro_id"], name: "index_dias_on_roteiro_id"
  end

  create_table "forma_pagamentos", force: :cascade do |t|
    t.string "tipo", limit: 20, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "localidades", force: :cascade do |t|
    t.text "endereco", null: false
    t.bigint "pais_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pais_id"], name: "index_localidades_on_pais_id"
  end

  create_table "paises", force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nome"], name: "index_paises_on_nome", unique: true
  end

  create_table "roteiros", force: :cascade do |t|
    t.string "nome", limit: 200
    t.text "descricao"
    t.float "preco", null: false
    t.bigint "forma_pagamento_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["forma_pagamento_id"], name: "index_roteiros_on_forma_pagamento_id"
  end

  add_foreign_key "atracoes", "localidades"
  add_foreign_key "cliente_roteiros", "clientes"
  add_foreign_key "cliente_roteiros", "roteiros"
  add_foreign_key "clientes", "dado_bancarios"
  add_foreign_key "dia_atracoes", "atracoes", column: "atracao_id"
  add_foreign_key "dia_atracoes", "dias"
  add_foreign_key "dias", "roteiros"
  add_foreign_key "localidades", "paises", column: "pais_id"
  add_foreign_key "roteiros", "forma_pagamentos"
end
