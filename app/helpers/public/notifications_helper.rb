module Public::NotificationsHelper
  def notification_message(notification)
    case notification.notifiable_type
    when "PostPlayer"
      "フォローしている#{notification.notifiable.user.name}さんが#{notification.notifiable.name}を投稿しました"
    else
      "投稿した#{notification.notifiable.post_player.name}が#{notification.notifiable.user.name}さんにいいねされました"
    end
  end
end
