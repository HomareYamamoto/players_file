class Public::CartPlayersController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart_player = CartPlayer.new(cart_player_params)
    @cart_player.user_id = current_user.id
    @cart_player.post_player_id = cart_player_params[:post_player_id]
    @cart_player.save
    redirect_to public_cart_players_path
  end


  def index
    @cart_player=CartPlayer.new
    @cart_players=current_user.cart_players
  end

  def update
    cart_player = CartPlayer.find(params[:id])
    cart_player.update(cart_player_params)
    redirect_to public_cart_players_path
  end

  def destroy
    @cart_player = CartPlayer.find(params[:id])
    @cart_player.destroy
    redirect_to public_cart_players_path
  end

  def destroy_all
    CartPlayer.destroy_all
    redirect_to public_cart_players_path
  end

  private
  def cart_player_params
      params.require(:cart_player).permit(:user_id, :post_player_id)
  end
end
