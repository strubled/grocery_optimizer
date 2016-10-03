class Allitem < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :thing, presence: true, uniqueness: {scope: [:thing, :store]}, length: { maximum: 100 }
  validates :zone, length: { maximum: 2 }
  validates :store, length: { maximum: 100 }

 def self.search(search)
  Allitem.where("thing LIKE ? OR store LIKE ? ", "%#{search}%", "%#{search}%") 
end
end
