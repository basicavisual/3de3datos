class Search < ApplicationRecord
  def search_fiscals
    fiscals = Fiscal.all

    fiscals = fiscals.where(["nombre LIKE ?", "%#{nombre}%"]) if nombre.present?
    fiscals = fiscals.where(["year LIKE ?", @year]) if @year.present?
    fiscals = fiscals.where(["puesto_simplificado LIKE ?", puesto_simplificado]) if puesto_simplificado.present?

    return fiscals
  end

end
