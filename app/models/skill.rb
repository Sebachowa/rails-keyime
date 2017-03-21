class Skill < ApplicationRecord
  has_attachments :photos, maximum: 2
  belongs_to :user
  has_many :reviews
  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, presence: true, inclusion: { in: ["Design", "Marketing", "Writing", "Video", "Music", "Programming", "Tech" "Bussiness", "Lifestyle"] }
  validates :description, presence: true
end
