class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_player
  has_one :notification, as: :notifiable, dependent: :destroy #追記

  validates :user_id, uniqueness: {scope: :post_player_id}

  after_create do
    create_notification(user_id: post_player.user_id)
  end

end
