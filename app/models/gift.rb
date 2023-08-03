class Gift < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :list

  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  # validates :photo, presence: true
  # validates :address, presence: true

  def has_email?
    assignee_email.present?
  end

  def has_user?
    user.present?
  end

  def has_assignee?
    has_email? || has_user?
  end

end
