# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drive_location do
    name "MyString"
    address "MyString"
    address_extended "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    country "MyString"
    drive nil
  end
end
