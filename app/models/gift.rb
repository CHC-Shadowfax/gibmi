class Gift < ApplicationRecord
  belongs_to :user
  belongs_to :list

  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :address, presence: true
end
