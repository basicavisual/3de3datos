class AddFieldsToInterests < ActiveRecord::Migration[5.1]
  def change
    change_table :interests do |t|
      t.string :puestoSimplificado
      t.string :genero
      t.string :aPaterno, after: :nombre
      t.string :aMaterno, after: :aPaterno
      t.integer :numeroRelacionesPersonales, after: :numeroRelacionesFamiliares
    end
  end
end
