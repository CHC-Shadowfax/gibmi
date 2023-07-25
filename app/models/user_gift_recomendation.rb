class UserGiftRecomendation < ApplicationRecord
  belongs_to :user
  belongs_to :gift, optional: true
  belongs_to :list, optional: true
end
