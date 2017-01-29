module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
    1.0 * ratings.inject(0.0){|sum, n| sum + n.score} / ratings.size

  end

end