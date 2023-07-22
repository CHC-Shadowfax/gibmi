class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :photo, presence: true
  paginates_per 4
end
