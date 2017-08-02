class SearchesController < ApplicationController

  def new
    @search = Search.new
    @puesto_simplificado = Person.all.distinct.pluck(:puesto_simplificado)
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find (params[:id])
  end

  private

  def search_params
    params.require(:search).permit(:nombre, :puesto_simplificado)
  end

end
