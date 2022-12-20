class Recipe < ApplicationRecord
  validates :name, presence: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :ratings, dependent: :destroy
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_name,
  against: [ :name ],
  using: {
    tsearch: { prefix: true }
  }

  def avg_rating
    if ratings.first
      ratings.all.map { |rating| rating.star }.sum / ratings.all.count
    else
      0
    end
  end
end
