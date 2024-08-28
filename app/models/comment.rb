class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true, touch: true
  belongs_to :user
  has_noticed_notifications model_name: "Noticed::Event"
  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"

  validates :content, presence: true

  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications

  private

  def notify_recipient
    CommentNotifier.with(record: self, commentable:).deliver_later(commentable.user)
  end

  def cleanup_notifications
    commentable.notifications.where(id: commentable.id).destroy_all
  end
end
