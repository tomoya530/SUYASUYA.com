class Item < ApplicationRecord

  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  validates :name, presence: true
  validates :image_id, presence: true
  validates :description, presence: true
  validates :evaluation, presence: true

  attachment :image

end
