class Public::PostPlayersController < ApplicationController

  def new
    @post_player=PostPlayer.new
  end

  def create
    @post_player=PostPlayer.new(post_player_params)
  end

  def index
  end

  def show
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
