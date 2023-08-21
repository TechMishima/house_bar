class CocktailsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @cocktails = Cocktail.order(created_at: :desc).limit(4)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @user = User.find(@cocktail.user.id)
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
    return unless user_signed_in? && current_user.id == cocktail.user_id

    cocktail.destroy
    redirect_to root_path
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

  def search
    params[:keyword] = '' if params[:keyword].nil?
    params[:alcohol_id] = '1' if params[:alcohol_id].nil?
    params[:user_id] = '' if params[:user_id].nil?

    if params[:keyword] != ''
      @cocktails = Cocktail.search(params[:keyword]).order(created_at: :desc).limit(4)
    elsif params[:alcohol_id] != '1'
      @cocktails = Cocktail.where(alcohol_id: params[:alcohol_id]).order(created_at: :desc).limit(4)
    elsif params[:user_id] != ''
      @cocktails = Cocktail.joins(:likes).where(likes: { user_id: params[:user_id] }).order(created_at: :desc).limit(4)
    else
      redirect_to root_path, notice: '条件を設定してから検索してください'
    end
  end

  private

  def cocktail_params
    params.require(:cocktail)
          .permit(:name, :description, :alcohol_id, :type_id, :ingredient, :tool, :recipe, :image)
          .merge(user_id: current_user.id)
  end

  def move_to_index
    return if user_signed_in?

    redirect_to root_path
  end
end
