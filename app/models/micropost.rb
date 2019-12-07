class Micropost < ApplicationRecord
  belongs_to :user #1対多の関係
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :favored_users, through: :favorites, source: :user
end
