class Nationality < ApplicationRecord

  has_many :post_players, dependent: :destroy


  validates :name, presence: true

end
