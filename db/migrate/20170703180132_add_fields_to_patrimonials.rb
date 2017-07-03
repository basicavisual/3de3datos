class AddFieldsToPatrimonials < ActiveRecord::Migration[5.1]
  def change
    change_table :patrimonials do |t|
      t.string :aPaterno, after: :nombre
      t.string :aMaterno, after: :aPaterno
    end
  end
end
