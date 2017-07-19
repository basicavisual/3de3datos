class Patrimonial < ApplicationRecord
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Patrimonial.create! row.to_hash
    end
  end
end
