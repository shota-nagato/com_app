class Integration < ApplicationRecord
  belongs_to :user

  encrypts :token

  validates :name, :token, presence: true
  validates :name, uniqueness: { scope: :user_id }
end
