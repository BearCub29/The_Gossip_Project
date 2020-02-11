class Gossip < ApplicationRecord
  validates :title, presence: true, length: { in: 3..14}
  validates :content, presence: true 
  validates :user_id, presence: true 
  belongs_to :user
  has_many :join_tag_gossips
  has_many :tags, through: :join_tag_gossips
  has_many :comments
  has_many :likes
end
