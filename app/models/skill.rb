class Skill < ApplicationRecord
  CATEGORIES = ["Design", "Marketing", "Writing", "Video", "Music", "Programming", "Tech", "Bussiness", "Lifestyle"]
  has_attachments :photos, maximum: 2
  belongs_to :user
  has_many :reviews
  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :description, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
