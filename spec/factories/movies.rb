# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "MyString"
    director "MyString"
    cast "MyString"
    link "MyString"
    abstract "MyString"
    language "MyString"
    country "MyString"
    
    #after(:create) {|m| FactoryGirl.create(:review, :reviewable => m) }
  end
  
  
end
