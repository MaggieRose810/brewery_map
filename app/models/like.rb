class Like < ApplicationRecord
  validates :positive, inclusion: { in: [ true, false ] }
  validates :user_uuid, :beer_ext_id, presence: :true
end
