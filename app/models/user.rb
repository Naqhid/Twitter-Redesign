class User < ApplicationRecord
  validates :username, uniqueness:true, presence: true, length: { maximum: 10 }
  validates :fullname, presence: true, length: { maximum: 50 }

  has_many :created_opinions, foreign_key: 'author_id', class_name: 'Opinion'

  has_many :followers, foreign_key: :followed_id, class_name: 'Following'
  has_many :user_followers, through: :followers, source: :follower

  has_many :followeds, foreign_key: :follower_id, class_name: 'Following'
  has_many :user_followeds, through: :followeds, source: :followed

  def not_followed
    followed_ids = []

    followed_ids = user_followeds.map do |f|
                   f.id
    end
    followed_ids.push(id)

    User.all.where.not(id: followed_ids)
  end
  def follower 
    User.all.where(id:follower_ids)
  end
end
