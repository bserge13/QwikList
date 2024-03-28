class User < ApplicationRecord 
  validates :email, :name, :password, presence: true  
  validates :email, uniqueness: true 
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}

  validates_confirmation_of :password
  has_secure_password

  has_many :lists 
end 