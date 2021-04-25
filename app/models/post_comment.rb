class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :beer

  validates :comment, presence: true, length: { minimum: 1, maximum: 500 }
  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1
  }, presence: true
end
