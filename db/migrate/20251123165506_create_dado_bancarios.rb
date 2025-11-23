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
