class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :avatar
  has_many :feeds, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :comments, dependent: :destroy
end
