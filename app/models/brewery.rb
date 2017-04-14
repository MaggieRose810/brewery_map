class Brewery < ApplicationRecord
  has_many :locations, primary_key: :ext_id, foreign_key: :brewery_ext_id
  validates :ext_id, uniqueness: true, presence: true
end
