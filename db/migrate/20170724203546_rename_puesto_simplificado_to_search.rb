class RenamePuestoSimplificadoToSearch < ActiveRecord::Migration[5.1]
  def change
        rename_column :searches, :puestoSimplificado, :puesto_simplificado
  end
end
