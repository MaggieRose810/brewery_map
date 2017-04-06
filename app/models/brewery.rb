class Brewery < ApplicationRecord
  has_many :locations, foreign_key: :ext_id
  validates :ext_id, uniqueness: true, presence: true
end
