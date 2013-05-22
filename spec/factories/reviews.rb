# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    title "MyString"
    body "MyString"
    reviewer "MyString"
  end
  
  factory :movie_review, class: Review do
    title "MyString"
    body "MyString"
    reviewer "MyString"
    association :movie
  end
  
  factory :book_review, class: Review do
    title "MyString"
    body "MyString"
    reviewer "MyString"
    association :book
  end
end
