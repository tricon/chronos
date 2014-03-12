# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drive, class: "Drive" do
    name "Happy Fun Drive"
    description "It's so fun!"
    recurs_every "15 minutes"
  end
end
