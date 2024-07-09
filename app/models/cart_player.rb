class CartPlayer < ApplicationRecord
  belongs_to :user
  belongs_to :post_player
end
