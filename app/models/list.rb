class List < ApplicationRecord
  belongs_to :user

  has_many :gifts, dependent: :destroy

  has_one_attached :photo

  after_create :generate_code

  def generate_code
    self.code = SecureRandom.hex(6)
    self.save
  end
end
