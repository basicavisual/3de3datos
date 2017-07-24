class SearchesController < ApplicationController

  def new
    @search = Search.new
    @year = Fiscal.all.distinct.pluck(:year)
    @puesto_simplificado = Fiscal.all.distinct.pluck(:puesto_simplificado)
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:nombre, :year, :puesto_simplificado)
  end

end
