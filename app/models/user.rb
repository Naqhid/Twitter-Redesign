class User < ApplicationRecord
  validates :username, uniqueness:true, presence: true, length: { maximum: 10 }
  validates :fullname, presence: true, length: { maximum: 50 }

  has_many :created_opinions, foreign_key: 'author_id', class_name: 'Opinion'

  has_many :followers, foreign_key: :followed_id, class_name: 'Following'
  has_many :user_followers, through: :followers, source: :follower

  has_many :followeds, foreign_key: :follower_id, class_name: 'Following'
  has_many :user_followeds, through: :followeds, source: :followed

  def not_followed
    not_followed = []

    not_followed = followeds.map do |f|
                   if f.follower_id!=id
                   end
    end

    not_followed
  end
end
