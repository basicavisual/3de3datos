class AddIdServidorPublicoIndexToTables < ActiveRecord::Migration[5.1]
  def change
    add_index :fiscals, :id_servidor_publico
    add_index :interests, :id_servidor_publico
    add_index :patrimonials, :id_servidor_publico
    add_index :people, :id_servidor_publico
  end
end
