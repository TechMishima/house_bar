class LikesController < ApplicationController
  before_action :set_like

  def create
    like = current_user.likes.build(cocktail_id: params[:cocktail_id])
    like.save
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find_by(cocktail_id: params[:cocktail_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_like
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
