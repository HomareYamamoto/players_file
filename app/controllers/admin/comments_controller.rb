class Admin::CommentsController < ApplicationController

  def destroy
    @post_player=PostPlayer.find(params[:post_player_id])
    Comment.find(params[:id]).destroy
    redirect_to request.referer
  end


  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
