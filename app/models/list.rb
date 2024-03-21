class List < ApplicationRecord
  validates :title, presence: true 

  has_many :list_items
  has_many :items, through: :list_items

  def self.desc_order 
    all.order(created_at: :desc) 
    # most recent list appears first 
  end
end