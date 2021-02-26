class Badge < ApplicationRecord

  has_many :badge_ownings, dependent: :destroy
  has_many :users, through: :badge_ownings

  validates :title, presence: true
  validates :image_url, presence: true

end
