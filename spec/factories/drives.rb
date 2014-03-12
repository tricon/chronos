# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drive, class: "Drive" do
    name "Happy Fun Drive"
    description "It's so fun!"
    recurs_every "15 minutes"

    factory :drive_with_location do
      ignore do
        drive_dates_count 2
        locations_count 1
      end

      after(:create) do |drive, evaluator|
        create_list(:drive_date, evaluator.drive_dates_count, drive: drive)
        create_list(:drive_location, evaluator.locations_count, drive: drive)
      end
    end
  end
end
