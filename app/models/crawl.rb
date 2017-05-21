class Crawl < ApplicationRecord
  ENDPOINTS = %w(locations)
  validates :name, :endpoint, presence: true
  validates :endpoint, inclusion: { in: ENDPOINTS }
  scope :processing, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }

  def completed
    completed_at.present?
  end

  def completed=(val)
    if !val.to_i.zero? && completed_at.blank?
      self.completed_at = Time.now
    elsif val.to_i.zero? && completed_at.present?
      self.completed_at = nil
    end
  end

  def completed?
    completed
  end
end
