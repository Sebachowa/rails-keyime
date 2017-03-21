class Skill < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, presence: true, inclusion: { in: %w(music design coding dance cocking)}
  validates :description, presence: true
end
