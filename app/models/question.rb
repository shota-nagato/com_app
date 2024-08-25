class Question < ApplicationRecord
  belongs_to :user

  validates :title, :content, presence: true

  def solved?
    !solved_at.nil?
  end
end
