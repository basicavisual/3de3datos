class ChangeColumnNamesToSnakeCase < ActiveRecord::Migration[5.1]
  def change
    rename_column :people, :idServidorPublico, :id_servidor_publico
    rename_column :fiscals, :idServidorPublico, :id_servidor_publico
    rename_column :patrimonials, :idServidorPublico, :id_servidor_publico
    rename_column :interests, :idServidorPublico, :id_servidor_publico
  end
end
