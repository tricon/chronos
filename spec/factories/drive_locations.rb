# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drive_location do
    name "Main Campus"
    address "4650 W. Sunset Blvd."
    city "Los Angeles"
    state "CA"
    zip "90027"
  end
end
