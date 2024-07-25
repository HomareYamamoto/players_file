class CartPlayer < ApplicationRecord
  belongs_to :user
  belongs_to :post_player

  # uniqueness: true#ベストイレブン機能
end
