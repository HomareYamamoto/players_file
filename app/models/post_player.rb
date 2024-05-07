class PostPlayer < ApplicationRecord

  belongs_to :user
  belongs_to :nationality
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

end
