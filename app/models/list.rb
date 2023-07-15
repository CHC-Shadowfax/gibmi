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

  has_one_attached :photo

  after_create :generate_code

  def generate_code
    self.code = SecureRandom.hex(6)
    self.save
  end
end
