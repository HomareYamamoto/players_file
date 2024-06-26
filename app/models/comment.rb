class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post_player
  has_one :notification, as: :notifiable, dependent: :destroy
  validates :body, presence: true

  # after_create do
  #   create_notification(user_id: book.user_id)
  # end

end
