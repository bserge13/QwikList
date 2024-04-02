class User < ApplicationRecord 
  validates :email, :name, :password, presence: true  
  validates :email, uniqueness: true 
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :notifications_on, inclusion: { in: [true, false] }

  validates_confirmation_of :password
  has_secure_password

  has_many :lists, dependent: :destroy  
end 