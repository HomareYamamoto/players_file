module Public::NotificationsHelper
  def notification_message(notification)
    case notification.notifiable_type
    when "PostPlayer"
      "フォローしている#{notification.notifiable.user.name}さんが#{notification.notifiable.name}を投稿しました"
    when "Favorite"
      "投稿した#{notification.notifiable.post_player.name}が#{notification.notifiable.user.name}さんにいいねされました"
    when "Comment"
      "投稿した#{notification.notifiable.post_player.name}にコメントがつきました"
    end
  end
end
