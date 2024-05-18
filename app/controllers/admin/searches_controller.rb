class Admin::SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    elsif @range == "PostPlayer"
      @post_players = PostPlayer.looks(params[:search], params[:word])
    else
      @nationalities = Nationality.looks(params[:search], params[:word])
    end
  end

end
