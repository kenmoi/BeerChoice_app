class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates_uniqueness_of :beer_id, scope: :user_id
end
