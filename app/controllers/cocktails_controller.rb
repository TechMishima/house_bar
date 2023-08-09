class CocktailsController < ApplicationController

  def index
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :description, :base_id, :type_id, :ingredient, :tool, :recipe)
  end

end