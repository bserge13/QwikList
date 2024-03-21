class List < ApplicationRecord
  validates :title, presence: true 

  has_many :list_items
  has_many :items, through: :list_items
end