class Location < ApplicationRecord
  belongs_to :brewery, foreign_key: :brewery_ext_id
  validates :ext_id, :brewery_ext_id, presence: true
  validates :ext_id, uniqueness: true
  scope :geocoded, -> { where.not(latitude: nil, longitude: nil) }
end
