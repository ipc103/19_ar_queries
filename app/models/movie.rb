class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :movie_categories
  has_many :categories, through: :movie_categories
  accepts_nested_attributes_for :categories

  def self.highest_rated
    joins(:reviews).group('movies.id').order('AVG(reviews.rating) DESC')
    # return all of the movies ordered by their average review score
  end

  def self.eighties
    self.where('release_year LIKE "198%"')
  end

  def self.lowest_rated

  end

  def self.most_reviewed
    self.joins(:reviews)
  end

  def self.horror
    self.joins(:categories).where(categories: {name: 'Horror'})
    # self.joins(:categories).where('categories.name = "Horror"')
  end

  def average_rating
    reviews.average('reviews.rating').to_f
  end

end
