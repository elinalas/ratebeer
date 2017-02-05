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
end