class AddNombreToSearch < ActiveRecord::Migration[5.1]
  def change
    add_column :searches, :nombre, :string
  end
end
