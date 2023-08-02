class UserGiftRecomendation < ApplicationRecord
  belongs_to :user
  belongs_to :gift, optional: true
  belongs_to :list, optional: true
  has_one :assignee, class_name: 'User', foreign_key: :id, primary_key: :assigned_user_id

  def has_email?
    assignee_email.present?
  end

  def has_assignee?
    assignee.present?
  end

  def assignee?
    has_email? || has_assignee?
  end
end

# 1. a{adir columna assignee_email a gifts_recomendations
# 2. rails db drop------
# 3. fix recommendations controller (check for both raise cases, send in paramas that current gift is a recommendation
