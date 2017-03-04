class Beer < ActiveRecord::Base
  include RatingAverage
  validates :name, length: { minimum: 1 }
  validates :style, presence: true

  belongs_to :brewery, touch: true
  has_many :raters, -> { uniq }, through: :ratings, source: :user
  has_many :ratings, dependent: :destroy
  belongs_to :style


  def to_s
    "#{name}, #{brewery.name}"
  end

  def average
    return 0 if ratings.empty?
    ratings.map{ |r| r.score }.sum / ratings.count.to_f
  end

  def best_three_beers
    return nil if ratings.empty?
    map = Hash.new([])
    ratings.each do |rating|
      map[rating.beer] += [rating.score]
      map.keys.each do |key|
        sum = 0
        map[key].each do |one|
          sum += one
        end
        map[key] = sum / map[key].size
      end
      map.max_by{|k,v| v}
    end
  end

  def self.top(n)
    sorted_by_rating_in_desc_order = Beer.all.sort_by{ |b| -(b.average_rating||0) }
    sorted_by_rating_in_desc_order[0,n]
  end

end
