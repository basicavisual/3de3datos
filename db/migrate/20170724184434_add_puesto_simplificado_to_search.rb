class AddPuestoSimplificadoToSearch < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :puestoSimplificado, :string
  end
end
