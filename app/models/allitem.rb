class Allitem < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :thing, length: { maximum: 100 }
  validates :zone, length: { maximum: 2 }
  validates :store, length: { maximum: 100 }
end
