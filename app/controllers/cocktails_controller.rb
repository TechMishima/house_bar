class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.order(created_at: :desc).limit(4)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
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

  def destroy
    cocktail = Cocktail.find(params[:id])
    if user_signed_in? && current_user.id == cocktail.user_id
      cocktail.destroy
      redirect_to root_path
    end
  end

  def edit 
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.update(cocktail_params)
      redirect_to cocktail_path(@cocktail.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def cocktail_params
    params.require(:cocktail)
    .permit(:name, :description, :alcohol_id, :type_id, :ingredient,:tool, :recipe, :image)
    .merge(user_id: current_user.id)
  end

end