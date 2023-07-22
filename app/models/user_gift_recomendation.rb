class UserGiftRecomendation < ApplicationRecord
  belongs_to :user
  belongs_to :gift, optional: true
end
  