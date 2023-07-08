class UserGiftRecomendation < ApplicationRecord
  belongs_to :user
  belongs_to :gift
end
