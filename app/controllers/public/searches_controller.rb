class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word]).page(params[:page]).per(10)
    elsif @range == "PostPlayer"
      @post_players = PostPlayer.looks(params[:search], params[:word]).page(params[:page]).per(10)
    else
      @nationalities = Nationality.looks(params[:search], params[:word]).page(params[:page]).per(10)
    end
  end

end
