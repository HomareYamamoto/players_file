class Public::PostPlayersController < ApplicationController

  def new
    @post_player=PostPlayer.new
  end

  def create
    @post_player=PostPlayer.new(post_player_params)
    @post_player.user_id = current_user.id
    if @post_player.save
      flash[:notice] = "選手登録完了"
      redirect_to public_post_player_path(@post_player.id)
    else
      render :new
    end
  end

  def index
    @post_players=PostPlayer.all
  end

  def show
    @post_player=PostPlayer.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def post_player_params
    params.require(:post_player).permit(:name, :body, :nationality_id)
  end


end
