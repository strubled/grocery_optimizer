class Store < ActiveRecord::Base
  belongs_to :user
  validates :store, length: { maximum: 100 }
end
