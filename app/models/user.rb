class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one_attached :photo

  enum role: %i[prospect user admin]
  after_initialize :set_default_role, if: :new_record?

  # def set_default_role
  #   self.role ||= :prospect
  # end

  # agregar admin a un user TO DO
end
