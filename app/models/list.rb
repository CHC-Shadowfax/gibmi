class List < ApplicationRecord
  PHOTO_ID = [
    ["Birthday", "kmLUcvhqhSo"],
    ["Wedding", "M2T1j-6Fn8w"],
    ["Anniversary", "okkDM8fQM7c"],
    ["Mothers Day", "xLA0XpFpe0U"],
    ["Fathers Day", "HjOgM76iUtE"],
    ["Graduation", "pYWuOMhtc6k"],
    ["Baby Shower", "kv1SCIAk6NU"],
    ["Christmas", "bNPIoil02tU"],
    ["Valentines Day", "8qxdUJf346A"],
    ["Other", "zMdOBBNPB5o"]
  ]

  belongs_to :user

  has_many :gifts, dependent: :destroy
  has_many :user_gift_recomendations, dependent: :destroy
  has_one_attached :photo

  after_create :generate_code

  validates :name, presence: true
  validates :photo_id, presence: true
  validate :current_date

  include PgSearch::Model

  pg_search_scope :search_by_code_or_user_email,
    against: [:code],
    associated_against: {
      user: [:email]
    },
    using: {
      tsearch: { prefix: false }
    }

  def generate_code
    self.code = SecureRandom.hex(6)
    self.save
  end

  def current_date
    if event_date.present? && event_date < Date.today
      errors.add(:event_date, "can't be in the past")
    end
  end
end
