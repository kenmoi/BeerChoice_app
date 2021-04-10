class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex: { man: 0, woman: 1}
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture


  with_options presence: true do
    validates :name, length: { minimum: 1, maximum: 8 }
    validates :email, uniqueness: true
    validates :sex
    validates :birth_date
    validates :prefecture_id
  end
end
