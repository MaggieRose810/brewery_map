class Crawl < ApplicationRecord
  ENDPOINTS = %w(locations)
  validates :name, :endpoint, presence: true
  validates :endpoint, inclusion: { in: ENDPOINTS }
  scope :processing, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }
end
