class List < ApplicationRecord
  validates :title, :body, presence: true 

end