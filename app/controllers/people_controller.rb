class PeopleController < ApplicationController

  def show
    @person = Person.find_by(servidor: params[:servidor])
    @fiscal = Fiscal.where(servidor: params[:servidor])
    @interest = Interest.where(servidor: params[:servidor])
    @patrimonial = Patrimonial.where(servidor: params[:servidor])
  end


end
