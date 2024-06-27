class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def update
    notification = current_user.notifications.find(params[:id])
    notification.update(read: true)
    # 通知の種類によるリダイレクトパスの生成
    case notification.notifiable_type
    when "PostPlayer"
      redirect_to public_post_player_path(notification.notifiable)
    when "Favorite"
      redirect_to public_user_path(notification.notifiable.user)
    when "Comment"
      redirect_to public_post_player_path(notification.notifiable.post_player)
    end
  end
end
