class UsersController < ApplicationController
  def show
    # binding.pry
    @user = User.find(params[:id])
    @cocktails = Cocktail.where(user_id: @user.id).order(created_at: :desc).limit(4)
  end
end
