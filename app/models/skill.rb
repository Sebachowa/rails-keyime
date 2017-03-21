class Skill < ApplicationRecord
  belongs_to :user
  has_many :reviews
  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, presence: true, inclusion: { in: %w(Music Design Coding Dance Cocking)}
  validates :description, presence: true
end
