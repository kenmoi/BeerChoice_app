class Beer < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  attachment :image
  enum style: { ラガー: 1, エール: 2, ハイブリッド: 3, その他: 4 }, _prefix: true
  enum retailer: { 専門店: 1, コンビニ・スーパー: 2, 通販サイト: 3, その他: 4 }, _prefix: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  with_options presence: true do
    validates :name, length: { minimum: 1, maximum: 20 }
    validates :style
    validates :retailer
  end
end