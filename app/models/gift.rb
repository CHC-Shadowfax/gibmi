class Gift < ApplicationRecord
  belongs_to :user
  belongs_to :list

  has_one_attached :photo
end
