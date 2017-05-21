class Location < ApplicationRecord
  belongs_to :brewery, foreign_key: :brewery_ext_id, primary_key: :ext_id
  validates :ext_id, :brewery_ext_id, presence: true
  validates :ext_id, uniqueness: true
  scope :geocoded, -> { where.not(latitude: nil, longitude: nil) }
  scope :created_before, -> (end_time){ where(created_at: Time.at(0)...end_time) }
  scope :created_between, -> (start, end_time) { where(created_at: start...end_time) }
end
