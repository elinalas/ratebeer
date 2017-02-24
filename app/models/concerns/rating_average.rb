module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
    if not ratings.empty?
      1.0 * ratings.inject(0.0){|sum, n| sum + n.score} / ratings.size

    else
      0
    end
  end


end