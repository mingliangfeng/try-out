# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book do
    title "MyString"
    author "MyString"
    abstract "MyString"
    publish_date "2013-05-22"
    
    #after(:create) {|b| FactoryGirl.create(:review, :reviewable => b) }
  end
  
  
end
