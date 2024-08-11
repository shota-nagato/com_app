class Feed < ApplicationRecord
  validates :title, :url, presence: true
  validates :url, uniqueness: true

  belongs_to :user
end
