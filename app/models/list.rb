class List < ApplicationRecord
  belongs_to :user

  after_create :generate_code

  def generate_code
    self.code = SecureRandom.hex(6)
    self.save
  end
end
