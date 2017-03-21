class Review < ApplicationRecord
  belongs_to :skill
  validates :title, presence: true
  validates :description, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: (0..5), allow_nil: false }
end
