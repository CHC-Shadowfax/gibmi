class List < ApplicationRecord
  belongs_to :user

  has_many :gifts, dependent: :destroy

  after_create :generate_code

  include PgSearch::Model

  pg_search_scope :search_by_code_or_user_email,
    against: [:code],
    associated_against: {
      users: [:email]
    },
    using: {
      tsearch: { prefix: true }
    }

  def generate_code
    self.code = SecureRandom.hex(6)
    self.save
  end
end
