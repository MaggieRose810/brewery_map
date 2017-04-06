class Location < ApplicationRecord
  validates :ext_id, :brewery_ext_id, presence: true
  validates :ext_id, uniqueness: true
end
