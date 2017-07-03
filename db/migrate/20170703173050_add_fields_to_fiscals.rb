class AddFieldsToFiscals < ActiveRecord::Migration[5.1]
  def change
    change_table :fiscals do |t|
      t.string :puestoSimplificado
      t.string :genero
      t.string :aPaterno, after: :nombre
      t.string :aMaterno, after: :aPaterno
    end
  end
end
