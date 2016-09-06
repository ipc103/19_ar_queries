class Movie < ActiveRecord::Base
  has_many :reviews
  has_many :movie_categories
  has_many :categories, through: :movie_categories
  accepts_nested_attributes_for :categories

  def self.highest_rated

  end

  def self.eighties
  end

  def self.lowest_rated

  end

  def self.most_reviewed

  end

  def self.horror

  end

  def average_rating
  
  end

end
