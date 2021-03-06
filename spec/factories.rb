FactoryGirl.define do

  factory :style do
    name "Pilsner"
    description ""

  end

  factory :style2, class: Style do
    name "Amber Ale"
    description ""

  end


  factory :user do
    username "Pekka"
    password "Foobar1"
    password_confirmation "Foobar1"
  end

  factory :user2, class: User do
    username "Simo"
    password "Foobar2"
    password_confirmation "Foobar2"
  end

  factory :rating do
    score 10
  end

  factory :rating2, class: Rating do
    score 20
  end


  factory :brewery do
    name "anonymous"
    year 1900
  end

  factory :beer do
    name "moi"
    brewery
    style
  end

end