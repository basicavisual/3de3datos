class AddYearToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :patrimonials, :year, :integer
    add_column :interests, :year, :integer
  end
end
