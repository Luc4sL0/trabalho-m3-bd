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
