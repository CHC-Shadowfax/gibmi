class User < ApplicationRecord
  attr_reader :categories_list

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #:confirmable

  has_one_attached :photo
  has_many :categories

  enum role: %i[prospect user admin]
  after_initialize :set_default_role, if: :new_record?

  has_many :lists, dependent: :destroy

  def set_default_role
    self.role ||= :prospect
  end

  def categories_list=(categories)
    self.categories = categories.split(',').map do |category|
      Category.where(name: category.strip).first_or_create!
    end
  end
end
