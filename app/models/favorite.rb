class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :beer_id, uniqueness: { scope: :user_id }
end
