class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  before_action :require
  validates :text, presence: true, length: { maximum: 126 }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
