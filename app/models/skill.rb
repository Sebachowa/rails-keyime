class Skill < ApplicationRecord
  CATEGORIES = ["Design", "Digital Marketing", "Writing & Translation", "Video & Animation", "Music & Video", "Programming & Tech", "Bussiness", "Fun & Lifestyle"]

  belongs_to :user
  has_many :reviews
  has_attachments :photos, maximum: 2
  validates :name, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES}
  validates :description, presence: true
end
