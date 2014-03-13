# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Gordon Freeman"
    email "gordon@blackmesa.valve"
    provider "Facebook"
    uid "123456789"
  end
end
