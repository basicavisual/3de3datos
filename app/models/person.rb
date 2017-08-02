class Person < ApplicationRecord
  has_many :fiscals
  has_many :patrimonials
  has_many :interests

  

end
