class User < ApplicationRecord
  attr_reader :categories_list

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :photo
  has_and_belongs_to_many :categories

  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  has_many :lists, dependent: :destroy
  has_many :user_gift_recomendations, dependent: :destroy

  # after_create :generate_recommendations
  after_create :add_user_to_gifts
  after_create :add_user_to_gift_recommendations


  def generate_recommendations
    RecommendationsWorker.perform_async(self.id)
  end

  # validates :email, presence: true
  # validates :password, presence: true, length: { minimum: 6 }

  def set_default_role
    self.role ||= :user
  end

  def categories_list=(categories)
    self.categories = categories.reject { |c| c.empty? }.map do |category|
      Category.where(title: category.strip).first_or_create
    end
    # require 'pry'; binding.pry
  end

  def add_user_to_gifts
    gifts = Gift.where(assignee_email: self.email)
    if gifts.any?
      gifts.each do |gift|
        gift.user = self
        gift.save
      end
    end
  end

  def add_user_to_gift_recommendations
    gifts = UserGiftRecomendation.where(assignee_email: self.email)
    if gifts.any?
      gifts.each do |gift|
        gift.user = self
        gift.save
      end
    end
  end
end
