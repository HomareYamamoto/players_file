class Public::CommentsController < ApplicationController

  def create
    @post_player = PostPlayer.find(params[:post_player_id])
    comment = current_user.comments.new(comment_params)
    comment.post_player_id = @post_player.id
    comment.save
    # redirect_to request.referer 非同期化に伴いコメントアウト
  end

  def destroy
    @post_player=PostPlayer.find(params[:post_player_id])
    Comment.find(params[:id]).destroy
    # redirect_to request.referer　非同期化に伴いコメントアウト
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end
