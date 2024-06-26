class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_guest, only: [:create]

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー外すとき
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー一覧
  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings.page(params[:page]).per(10)
  end

  # フォロワー一覧
  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers.page(params[:page]).per(10)
  end

  private

  def check_guest
    user = current_user
    if user.name == "ゲスト" && user.email == "guest@example.com"
      redirect_to public_my_page_path
    end
  end


end
