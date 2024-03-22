class List < ApplicationRecord
  validates :title, presence: true 

  has_many :items

  def self.desc_order 
    all.order(created_at: :desc) 
    # most recent list appears first 
  end
end