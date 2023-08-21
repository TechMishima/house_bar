class FollowsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @users = current_user.followings
  end

  private

  def move_to_index
    return if user_signed_in?

    redirect_to root_path
  end
end
