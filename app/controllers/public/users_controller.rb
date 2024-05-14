class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_existence, only: [:show, :edit, :update]

  def my_page
    @user=current_user
    @post_players=@user.post_players
  end


  def index
    @users=User.all
  end

  def show
    @user=User.find(params[:id])
    @post_players=@user.post_players
  end

  def edit
    @user=current_user
  end

  def update
    @user=current_user
    if @user.update(user_params)
      redirect_to public_my_page_path, notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
    @user=User.find(current_user.id)
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def check_user_existence
      @user=User.find_by(id: params[:id])
      unless @user
        redirect_to public_users_path
      end
  end

end
