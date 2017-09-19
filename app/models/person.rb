class Person < ApplicationRecord
  has_many :fiscals
  has_many :patrimonials
  has_many :interests

  scope :search_by_full_name, ->(nombre) { where("CONCAT_WS(' ', nombre, a_paterno, a_materno) LIKE :nombre", nombre: "%#{nombre.upcase.to_s}%") }
  # @year_range = [2016, Date.today.year]
  # def existence(servidor, tab)
  #   existance = tab.where(servidor:, servidor)
  #
  # end

end
