class PeopleController < ApplicationController

  def show
    @person = Person.find_by(servidor: params[:servidor])
  end
end
