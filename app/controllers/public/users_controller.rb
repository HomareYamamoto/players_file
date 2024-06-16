class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :check_guest, only: [:edit, :update, :unsubscribe]
  before_action :check_user_existence, only: [:show, :edit, :update]

  def my_page
    @user=current_user
    @post_players=@user.post_players.page(params[:page]).per(10)
  end


  def index
    @users=User.page(params[:page]).per(10)
  end

  def show
    @user=User.find(params[:id])
    @post_players=@user.post_players.page(params[:page]).per(11)
  end

  def edit
    @user=current_user
  end

  def update
    @user=current_user
    if @user.update(user_params)
      redirect_to public_my_page_path, notice: "更新完了"
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

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_player_id)
    @favorite_post_players = PostPlayer.where(id: favorites).page(params[:page]).per(10)
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


  def check_guest
    user = current_user
    if user.name == "ゲスト" && user.email == "guest@example.com"
      redirect_to public_my_page_path
    end
  end

end
