class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.integer :idServidorPublico
      t.string :nombre
      t.string :aPaterno
      t.string :aMaterno
      t.string :genero
      t.string :puestoEncargo
      t.string :puestoSimplificado

      t.timestamps
    end
  end
end
