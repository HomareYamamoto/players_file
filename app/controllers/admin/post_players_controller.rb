class Admin::PostPlayersController < ApplicationController
  before_action :check_post_player_existence, only: [:show, :edit, :update, :destroy]


  def index
    @post_players=PostPlayer.page(params[:page]).per(10)
  end

  def show
    @post_player=PostPlayer.find(params[:id])
    @comment=Comment.new
  end

  def edit
    @post_player=PostPlayer.find(params[:id])
  end

  def update
    @post_player=PostPlayer.find(params[:id])
    if @post_player.update(post_player_params)
      flash[:notice] = "投稿編集完了"
      redirect_to admin_post_player_path(@post_player.id)
    else
      render :edit
    end
  end

  def destroy
    @post_player = PostPlayer.find(params[:id])
    @post_player.destroy
    redirect_to admin_post_players_path
  end


  private

  def post_player_params
    params.require(:post_player).permit(:name, :body, :nationality_id)
  end

  def check_post_player_existence
    @post_player=PostPlayer.find_by(id: params[:id])
    unless @post_player
      redirect_to admin_post_players_path
    end
  end

end
