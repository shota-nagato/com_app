class Entry < ApplicationRecord
  validates :title, :url, :published_at, presence: true
  validates :url, uniqueness: true

  belongs_to :feed
end
