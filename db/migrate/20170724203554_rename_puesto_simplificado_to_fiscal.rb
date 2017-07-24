class RenamePuestoSimplificadoToFiscal < ActiveRecord::Migration[5.1]
  def change
    rename_column :fiscals, :puestoSimplificado, :puesto_simplificado
  end
end
