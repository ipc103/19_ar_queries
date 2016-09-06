class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :movie_categories
  has_many :categories, through: :movie_categories

  def self.highest_rated
    Movie.joins(:reviews).group('movies.id').order('AVG(reviews.rating) DESC')
  end

  def self.lowest_rated
    Movie.joins(:reviews).group('movies.id').order('AVG(reviews.rating) ASC')
  end

  def self.most_reviewed
    Movie.joins(:reviews).group('movies.id').order("COUNT(reviews.id)").first
  end

  def average_rating
    reviews.average(:rating).to_f
  end

end
