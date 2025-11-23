class CreateLocalidades < ActiveRecord::Migration[7.2]
  def change
    create_table :localidades do |t|
      t.text :endereco, null: false
      t.references :pais, null: false, foreign_key: {to_table: :paises}

      t.timestamps
    end
  end
end
