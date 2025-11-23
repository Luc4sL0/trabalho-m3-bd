class CreatePaises < ActiveRecord::Migration[7.2]
  def change
    create_table :paises do |t|
      t.string :nome, null: false
      
      t.timestamps
    end
    
    add_index :paises, :nome, unique: true
  end
end
