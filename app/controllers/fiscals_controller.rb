class FiscalsController < ApplicationController
  def index
    @fiscals = Fiscal.last(5)
  end

  def import
    Fiscal.import(params[:file])
    redirect_to root_url, notice: "Datos importados exitosamente"
  end
end
