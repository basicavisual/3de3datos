class ChangeColumnIdServidorPublico < ActiveRecord::Migration[5.1]
  def change
    rename_column :people, :id_servidor_publico, :servidor
    rename_column :fiscals, :id_servidor_publico, :servidor
    rename_column :patrimonials, :id_servidor_publico, :servidor
    rename_column :interests, :id_servidor_publico, :servidor
  end
end
