class Fiscal < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Fiscal.create! row.to_hash
    end
  end
end
