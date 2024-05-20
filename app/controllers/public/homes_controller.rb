class Public::HomesController < ApplicationController
  def top
    @post_players=PostPlayer.order('id DESC').limit(8)
  end

  def about
  end


end
