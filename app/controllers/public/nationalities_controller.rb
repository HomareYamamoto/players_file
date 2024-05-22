class Public::NationalitiesController < ApplicationController
  before_action :check_nationality_existence, only: [:show]

  def show
    @nationality = Nationality.find(params[:id])
    @nationality_post_players=@nationality.post_players.page(params[:page]).per(4)
  end

  private

  def check_nationality_existence
    @nationality=Nationality.find_by(id: params[:id])
    unless @nationality
      redirect_to admin_nationalities_path
    end
  end


end
