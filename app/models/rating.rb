class Rating < ActiveRecord::Base
  include RatingAverage
  belongs_to :beer, touch: true
  belongs_to :user   # rating kuuluu myös käyttäjään

  validates :score, numericality: { greater_than_or_equal_to: 1,
                                    less_than_or_equal_to: 50,
                                    only_integer: true }

  def to_s
    "#{beer.name} #{score}"
  end

  def self.last_five_ratings
    a = []
    a = Rating.all
    a[0,5]
  end


end