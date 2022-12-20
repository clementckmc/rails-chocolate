class Rating < ApplicationRecord
  validates :star, presence: true
  belongs_to :recipe
end
