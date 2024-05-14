class PostPlayer < ApplicationRecord

  belongs_to :user
  belongs_to :nationality
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy



  validates :name, presence: true
  validates :nationality_id, presence: true
  validates :body, presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
