class Item < ApplicationRecord
  validates :description, presence: true 

  has_many :list_items
  has_many :lists, through: :list_items

end