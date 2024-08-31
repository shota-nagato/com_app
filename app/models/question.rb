class Question < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :notifications, through: :user, dependent: :destroy
  has_many :notification_mentions, through: :user, dependent: :destroy
  has_noticed_notifications model_name: "Noticed::Notification"

  validates :title, :content, presence: true

  scope :by_keyword, ->(title) { where("title ILIKE ?", "%#{title}%") }

  def solved?
    !solved_at.nil?
  end
end
