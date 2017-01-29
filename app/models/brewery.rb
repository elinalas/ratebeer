class Brewery < ActiveRecord::Base
  include RatingAverage

  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  def print_report
    self.name
    "established at year #{year}"
    "number of beers #{beers.count}"
  end



  def restart
    self.year = 2017
    "changed year to #{year}"
  end
end