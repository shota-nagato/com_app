class Feed < ApplicationRecord
  validates :title, :url, presence: true

  belogns_to :user
end
