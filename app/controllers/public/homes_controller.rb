class Public::HomesController < ApplicationController
  def top
    @post_players=PostPlayer.order('id DESC').limit(3)
  end

  def about
  end


end
