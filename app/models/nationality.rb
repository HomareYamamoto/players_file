class Nationality < ApplicationRecord

  has_many :post_players, dependent: :destroy


  validates :name, presence: true, uniqueness: true


  def self.looks(search, word)
    if search == "perfect_match"
      @nationality = Nationality.where("name LIKE?","#{word}")
    elsif search == "forward_match"
      @nationality = Nationality.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @nationality = Nationality.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @nationality = Nationality.where("name LIKE?","%#{word}%")
    else
      @nationality = Nationality.all
    end
  end

end
