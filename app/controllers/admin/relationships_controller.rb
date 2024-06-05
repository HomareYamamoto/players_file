class Admin::RelationshipsController < ApplicationController


  # フォロー一覧
  def followings
    user = User.find(params[:user_id])
    @users = user.followings.page(params[:page]).per(10)
  end

  # フォロワー一覧
  def followers
    user = User.find(params[:user_id])
    @users = user.followers.page(params[:page]).per(10)
  end


end
