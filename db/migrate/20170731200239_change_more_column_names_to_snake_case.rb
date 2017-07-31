class ChangeMoreColumnNamesToSnakeCase < ActiveRecord::Migration[5.1]
  def change
    rename_column :people, :aPaterno, :a_paterno
    rename_column :fiscals, :aPaterno, :a_paterno
    rename_column :patrimonials, :aPaterno, :a_paterno
    rename_column :interests, :aPaterno, :a_paterno

    rename_column :people, :aMaterno, :a_materno
    rename_column :fiscals, :aMaterno, :a_materno
    rename_column :patrimonials, :aMaterno, :a_materno
    rename_column :interests, :aMaterno, :a_materno

    rename_column :people, :puestoEncargo, :puesto_encargo
    rename_column :fiscals, :puestoEncargo, :puesto_encargo
    rename_column :patrimonials, :puestoEncargo, :puesto_encargo
    rename_column :interests, :puestoEncargo, :puesto_encargo

    rename_column :people, :puestoSimplificado, :puesto_simplificado
    rename_column :patrimonials, :puestoSimplificado, :puesto_simplificado
    rename_column :interests, :puestoSimplificado, :puesto_simplificado

    rename_column :searches, :puestoEncargo, :puesto_encargo
  end
end
