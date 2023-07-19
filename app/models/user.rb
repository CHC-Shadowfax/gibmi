class User < ApplicationRecord
  attr_reader :categories_list

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable #:confirmable

  has_one_attached :photo
  has_and_belongs_to_many :categories

  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  has_many :lists, dependent: :destroy

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
end
