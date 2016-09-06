class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :movie_categories
  has_many :categories, through: :movie_categories

  def self.highest_rated
    self.joins(:reviews).group('movies.id').order('AVG(reviews.rating) DESC')
  end

  def self.eighties
    self.where('release_year >= 1980 AND release_year <= 1989')
  end

  def self.lowest_rated
    self.joins(:reviews).group('movies.id').order('AVG(reviews.rating) ASC')
  end

  def self.most_reviewed
    self.joins(:reviews).group('movies.id').order("COUNT(reviews.id)").first
  end

  def self.horror
    joins(:movie_categories => [:category])
    .where(categories: {name: 'Horror'})
  end

  def average_rating
    self.reviews.average(:rating).to_f
  end

end
