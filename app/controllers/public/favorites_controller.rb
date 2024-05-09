class Public::FavoritesController < ApplicationController


  def create
    post_player = PostPlayer.find(params[:post_player_id])
    favorite = current_user.favorites.new(post_player_id: post_player.id)
    favorite.save
    redirect_to request.referer
  end

  def destroy
    post_player = PostPlayer.find(params[:post_player_id])
    favorite = current_user.favorites.find_by(post_player_id: post_player.id)
    favorite.destroy
    redirect_to request.referer
  end


end
