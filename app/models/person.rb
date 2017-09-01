class Person < ApplicationRecord
  has_many :fiscals
  has_many :patrimonials
  has_many :interests

#  scope :search_by_full_name, ->(nombre) { where("nombre LIKE :nombre OR a_paterno LIKE :nombre OR CONCAT_WS(' ', nombre, a_paterno) LIKE :nombre OR CONCAT_WS(' ', nombre, a_paterno, a_materno) LIKE :nombre", nombre: "%#{nombre}%") }
  scope :search_by_full_name, ->(nombre) { where("CONCAT_WS(' ', nombre, a_paterno, a_materno) LIKE :nombre", nombre: "%#{nombre.upcase.to_s}%") }


end
