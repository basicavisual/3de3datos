class CreatePatrimonials < ActiveRecord::Migration[5.1]
  def change
    create_table :patrimonials do |t|

      t.timestamps
    end
  end
end
