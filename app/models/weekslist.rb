class Weekslist < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :thing, presence: true, length: { maximum: 100 }
  validates :zone, length: { maximum: 2 }
  validates :store, presence: true, length: { maximum: 100 }


end
