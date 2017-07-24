class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :name
      t.string :puestoEncargo
      t.integer :year

      t.timestamps
    end
  end
end
