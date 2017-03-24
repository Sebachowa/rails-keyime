class Skill < ApplicationRecord
  CATEGORIES = ["Design", "Marketing", "Writing", "Video", "Music", "Programming", "Tech", "Bussiness", "Lifestyle"]
  has_attachments :photos, maximum: 2
  belongs_to :user
  has_many :reviews
  has_many :bookings
  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :description, presence: true

   geocoded_by :location
   after_validation(:geocode, { if: :location_changed? })

end
