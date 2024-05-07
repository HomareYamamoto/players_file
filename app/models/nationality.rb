class Nationality < ApplicationRecord
    has_many :post_players, dependent: :destroy


end
