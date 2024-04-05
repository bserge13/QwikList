class List < ApplicationRecord
  validates :title, presence: true 

  belongs_to :user
  has_many :items, dependent: :destroy
  
  def self.desc_order 
    all.order(created_at: :desc) 
  end

end