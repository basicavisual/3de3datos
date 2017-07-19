class AddidPatrimonialToPatrimonial < ActiveRecord::Migration[5.1]
  def change
    change_table :patrimonials do |t|
      t.integer :id_patrimonial
    end
  end
end
