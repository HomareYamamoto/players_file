class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_player = PostPlayer.find(params[:post_player_id])
    favorite = current_user.favorites.new(post_player_id: @post_player.id)
    favorite.save
  end

  def destroy
    @post_player = PostPlayer.find(params[:post_player_id])
    favorite = current_user.favorites.find_by(post_player_id: @post_player.id)
    favorite.destroy
  end


end
