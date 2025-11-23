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
