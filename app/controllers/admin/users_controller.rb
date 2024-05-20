class Admin::UsersController < ApplicationController
  before_action :check_user_existence, only: [:show, :edit, :update]

  def index
    @users=User.page(params[:page]).per(10)
  end

  def show
    @user=User.find(params[:id])
    @post_players=@user.post_players.page(params[:page]).per(10)
  end

  def edit
    @user=User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "会員情報を更新しました。"
    else
      render :edit
    end
  end



private

  def user_params
    params.require(:user).permit(:name, :email, :is_active)
  end

  def check_user_existence
      @user=User.find_by(id: params[:id])
      unless @user
        redirect_to admin_users_path
      end
  end


end
