class Category < ActiveRecord::Base
  has_many :movie_categories
  has_many :movies, through: :movie_categories

  def self.highest_rated

  end

  def average_rating
  
  end

end
