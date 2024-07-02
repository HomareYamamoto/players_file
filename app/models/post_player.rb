class PostPlayer < ApplicationRecord

  belongs_to :user
  belongs_to :nationality
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy #追記


  validates :name, presence: true
  validates :nationality_id, presence: true
  validates :body, presence: true

  scope :latest, -> { order(created_at: :desc) }  #desc = 降順
  scope :old, -> { order(created_at: :asc) }  #asc = 昇順
  scope :most_favorited, -> { includes(:favorites)}


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  after_create do
    user.followers.each do |follower|
      notifications.create(user_id: follower.id)
    end
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @post_player = PostPlayer.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @post_player = PostPlayer.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @post_player = PostPlayer.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @post_player = PostPlayer.where("name LIKE?","%#{word}%")
    else
      @post_player = PostPlayer.all
    end
  end

end
