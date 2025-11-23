class CreateDiaAtracoes < ActiveRecord::Migration[7.2]
  def change
    create_table :dia_atracoes do |t|
      t.references :dia, null: false, foreign_key: { to_table: :dias }
      t.references :atracao, null: false, foreign_key: { to_table: :atracoes }

      t.timestamps
    end
  end
end
