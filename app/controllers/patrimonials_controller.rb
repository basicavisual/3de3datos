class PatrimonialsController < ApplicationController


  def index
    @patrimonials = Patrimonial.last(5)
  end

  def import
    Patrimonial.import(params[:file])
    redirect_to action: "index", notice: "Datos importados exitosamente"
  end
end
