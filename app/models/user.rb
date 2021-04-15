class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :beers, dependent: :destroy
  enum sex: { man: 0, woman: 1}
  enum favorite_style: { ラガー: 1, エール: 2, ハイブリッド: 3, その他: 4 }
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  delegate :pref_name, to: :prefecture
  attachment :profile_image

  def active_for_authentication?
    super && (is_deleted == false)
  end


  with_options presence: true do
    validates :name, length: { minimum: 1, maximum: 8 }
    validates :email, uniqueness: true
    validates :sex
    validates :birth_date
    validates :prefecture_id
  end
end
