class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_players, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy


  has_many :relationships, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  has_many :followings, through: :relationships, source: :follower
  has_many :followers, through: :reverse_of_relationships, source: :follow

  validates :name, presence: true
  validates :email, presence: true


  def active_for_authentication?
    super && (is_active == true)
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      user.name = "ゲスト"
    end
  end



  # フォローしたときの処理
  def follow(user_id)
    relationships.create(follower_id: user_id)
    #createの後に入れる引数はフォローされる人の引数を記述する。
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(follower_id: user_id).destroy
    #find_byの後に入れる引数はフォローされる人の引数を記述する。
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @user = User.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @user = User.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @user = User.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @user = User.where("name LIKE?","%#{word}%")
    else
      @user = User.all
    end
  end



end
