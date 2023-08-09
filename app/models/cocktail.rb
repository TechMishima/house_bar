class Cocktail < ApplicationRecord
  validates :name, presence: true
  validates :base_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  validates :type_id, presence: true, numericality: { other_than: 1, message: "を入力してください" }
  has_one_attached :image

  belongs_to :user
end
