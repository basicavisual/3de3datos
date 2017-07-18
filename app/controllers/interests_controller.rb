class InterestsController < ApplicationController
  def index
    @interests = Interest.last(5)
  end

  def import
    Interest.import(params[:file])
    redirect_to root_url, notice: "Datos importados exitosamente"
  end
end
