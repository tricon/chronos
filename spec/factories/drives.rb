# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drive, :class => 'Drive' do
    name "MyString"
    starts_at "2014-03-04 14:17:01"
    ends_at "2014-03-04 14:17:01"
    description "MyText"
  end
end
