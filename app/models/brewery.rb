class Brewery < ActiveRecord::Base
  include RatingAverage
  validates :name, length: { minimum: 1 }
  validate :year_not_more_than_now
  validates :year, numericality: { greater_than_or_equal_to: 1042, only_integer: true }

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  def print_report
    self.name
    "established at year #{year}"
    "number of beers #{beers.count}"
  end

  def year_not_more_than_now
     if year > Time.now.year
       errors.add(:year, "Year can't be more than current year.")
     end
  end



  def restart
    self.year = 2017
    "changed year to #{year}"
  end
end