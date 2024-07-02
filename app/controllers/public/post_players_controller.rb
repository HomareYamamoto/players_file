class Public::PostPlayersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def new
    @post_player=PostPlayer.new
  end

  def create
    @post_player=PostPlayer.new(post_player_params)
    @post_player.user_id = current_user.id
    if @post_player.save
      flash[:notice] = "選手登録完了"
      redirect_to public_post_player_path(@post_player.id)
    else
      render :new
    end
  end

  def index
    # @post_players=PostPlayer.page(params[:page]).per(5).order(created_at: :desc)並べ替え実装につき廃止

    if params[:latest]
      @post_players = PostPlayer.latest.page(params[:page]).per(5)
    elsif params[:old]
      @post_players = PostPlayer.old.page(params[:page]).per(5)
    elsif params[:most_favorited]
      most_favorited = PostPlayer.includes(:favorites).sort_by { |x| x.favorites.includes(:favorites).size }.reverse
      @post_players=Kaminari.paginate_array(most_favorited).page(params[:page]).per(5)
    else
      @post_players = PostPlayer.page(params[:page]).per(5).order(created_at: :desc)
    end
  end

  def show
    @post_player=PostPlayer.find(params[:id])
    @comment=Comment.new
  end

  def edit
    @post_player=PostPlayer.find(params[:id])
  end

  def update
    @post_player=PostPlayer.find(params[:id])
    if @post_player.update(post_player_params)
      redirect_to public_post_player_path(@post_player.id),notice: "更新完了"
    else
      render :edit
    end
  end

  def destroy
    @post_player = PostPlayer.find(params[:id])
    @post_player.destroy
    redirect_to public_post_players_path
  end


  private

  def post_player_params
    params.require(:post_player).permit(:name, :body, :nationality_id)
  end

  def ensure_correct_user
    @post_player = PostPlayer.find(params[:id])
    unless @post_player.user == current_user
      redirect_to public_post_players_path
    end
  end

end
