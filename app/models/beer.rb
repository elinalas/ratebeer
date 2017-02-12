class Beer < ActiveRecord::Base
  include RatingAverage
  validates :name, length: { minimum: 1 }
  validates :style, presence: true

  belongs_to :brewery
  has_many :raters, -> { uniq }, through: :ratings, source: :user
  has_many :ratings, dependent: :destroy


  def to_s
    "#{name}, #{brewery.name}"
  end

  def average
    return 0 if ratings.empty?
    ratings.map{ |r| r.score }.sum / ratings.count.to_f
  end



end
