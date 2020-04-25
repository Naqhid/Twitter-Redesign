class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User'
  scope :ordered_by_most_recent, -> { order(created_at: :asc) }
end
