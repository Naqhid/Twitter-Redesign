class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 20 }
  validates :fullname, presence: true, length: { maximum: 10 }

  has_many: opinions
  has_many: followers, foreign_key: :follower_id, class_name: 'Following'
  has_many: followeds, foreign_key: :followed_id, class_name: 'Following'

end
