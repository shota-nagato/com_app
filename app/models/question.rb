class Question < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, :content, presence: true

  def solved?
    !solved_at.nil?
  end
end
