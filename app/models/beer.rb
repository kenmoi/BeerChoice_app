class Beer < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  enum style: { ラガー: 1, エール: 2, ハイブリッド: 3, その他: 4 }, _prefix: true
  enum retailer: { 専門店: 1, コンビニ・スーパー: 2, 通販サイト: 3, その他: 4 }, _prefix: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(word)
      @beer = Beer.where("name LIKE?","%#{word}%")
  end

  def self.sort(sort)
    case sort
    when 'new'
      return all.order(created_at: :desc)
    when 'old'
      return all.order(created_at: :asc)
    when 'many'
      return find(PostComment.group(:beer_id).order('count(beer_id) desc').pluck(:beer_id))
    when 'likes'
      return find(Favorite.group(:beer_id).order('count(beer_id) desc').pluck(:beer_id))
    end
  end

  with_options presence: true do
    validates :name, length: { minimum: 1, maximum: 15 }, uniqueness: true
    validates :style
    validates :retailer
  end
end