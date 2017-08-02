class Patrimonial < ApplicationRecord

  belongs_to :person, foreign_key: 'servidor'

  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Patrimonial.create! row.to_hash
    end
  end
end
