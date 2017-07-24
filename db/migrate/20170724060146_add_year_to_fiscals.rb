class AddYearToFiscals < ActiveRecord::Migration[5.1]
  def change
    add_column :fiscals, :year, :integer
  end
end
