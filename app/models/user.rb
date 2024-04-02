class User < ApplicationRecord 
  validates :email, :name, :password, presence: true  
  validates :email, uniqueness: true 
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}

  validates :notifications_on, inclusion: { in: [true, false] }
  validates :phone_num, format: { with: /\A\+1\d{10}\z/ }, allow_blank: true

  validates_confirmation_of :password
  has_secure_password

  has_many :lists, dependent: :destroy  

  def self.notification_numbers 
    where(notifications_on: true).where.not(phone_num: nil).pluck(:phone_num)
  end
end 