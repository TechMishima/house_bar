class Cocktail < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true
  validates :alcohol_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :type_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  has_one_attached :image

  belongs_to :user
  belongs_to :alcohol
  belongs_to :type
  has_many :likes

  def self.search(search)
    if search != ""
      Cocktail.where('ingredient LIKE(?)', "%#{search}%")
    else
      Cocktail.all
    end
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
