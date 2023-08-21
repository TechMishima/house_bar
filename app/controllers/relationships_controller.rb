class RelationshipsController < ApplicationController
  before_action :move_to_index

  def create
    follow = current_user.active_relationships.new(follower_id: params[:user_id])
    follow.save
    redirect_to user_path(params[:user_id])
  end

  def destroy
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to user_path(params[:user_id])
  end

  private

  def move_to_index
    return if user_signed_in?

    redirect_to root_path
  end
end
