class User < ActiveRecord::Base
  include RatingAverage

  validates :username, uniqueness: true,
            length: { minimum: 3, maximum: 30 }
  PASSWORD_FORMAT = /\A(?=.{4,})(?=.*\d)(?=.*[A-Z])/x

  validates :password,
            format: {with: PASSWORD_FORMAT},
            confirmation: true


  has_secure_password
  has_many :ratings
  has_many :memberships
  has_many :beers, through: :ratings
  has_many :beer_clubs, through: :memberships

  def favorite_beer
    return nil if ratings.empty?
    ratings.order(score: :desc).limit(1).first.beer
  end

  def favorite_style
    return nil if ratings.empty?
    map = Hash.new([])
    ratings.each do |rating|
      map[rating.beer.style] += [rating.score]
    end
    map.keys.each do |key|
      sum = 0
      map[key].each do |one|
        sum += one
      end
      map[key] = sum / map[key].size
    end
    map.max_by{|k,v| v}.first
  end

  def favorite_brewery
    return nil if ratings.empty?
    map = Hash.new([])
    ratings.each do |rating|
      map[rating.beer.brewery] += [rating.score]
    end
    map.keys.each do |key|
      sum = 0
      map[key].each do |one|
        sum += one
      end
      map[key] = sum / map[key].size
    end
    map.max_by{|k,v| v}.first
  end
end