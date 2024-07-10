class Public::CartPlayersController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart_player = CartPlayer.new(cart_player_params)
    @cart_player.user_id = current_user.id
    @cart_player.post_player_id = cart_player_params[:post_player_id]
    @cart_item.save
    redirect_to public_cart_items_path
  end


  def index
    @cart_player=CartPlayer.new
    @cart_players=current_user.cart_players
  end


  private
  def cart_player_params
      params.require(:cart_player).permit(:user_id, :post_player_id)
  end
end
