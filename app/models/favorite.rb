class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_player

  validates :user_id, uniqueness: {scope: :post_player_id}

end
