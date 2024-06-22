class Public::NotificationsController < ApplicationController
  before_action :authenticate_user!

  def update
    notification = current_user.notifications.find(params[:id])
    notification.update(read: true)
    # 通知の種類によるリダイレクトパスの生成
    case notification.notifiable_type
    when "PostPlayers"
      redirect_to public_post_player_path(notification.notifiable)
    else
      redirect_to public_user_path(notification.notifiable.user)
    end
  end
end
