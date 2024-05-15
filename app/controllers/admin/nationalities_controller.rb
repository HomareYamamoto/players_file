class Admin::NationalitiesController < ApplicationController
before_action :check_nationality_existence, only: [:edit, :update]

  def create
    @nationality = Nationality.new(nationality_params)
      if @nationality.save
        flash[:notice] = "国籍を登録しました。"
        redirect_to admin_nationalities_path
      else
        @nationalities = Nationality.all
        render :index
      end
  end

  def index
    @nationalities = Nationality.all
    @nationality = Nationality.new
  end

  def edit
    @nationality = Nationality.find(params[:id])
  end

  def update
    @nationality = Nationality.find(params[:id])
    if @nationality.update(nationality_params)
      flash[:notice] = "国籍を更新しました。"
      redirect_to admin_nationalities_path
    else
      render :edit
    end
  end

  def destroy
    @nationality = Nationality.find(params[:id])
    @nationality.destroy
    flash[:notice] = "国籍を削除しました。"
    redirect_to admin_nationalities_path
  end



  private

  def nationality_params
    params.require(:nationality).permit(:name)
  end


  def check_nationality_existence
    @nationality=Nationality.find_by(id: params[:id])
    unless @nationality
      redirect_to admin_nationalities_path
    end
  end

end
