# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drive, class: "Drive" do
    name "Happy Fun Drive"
    description "It's so fun!"
    recurs_every "15 minutes"


    ignore do
      drive_dates_count 2
    end

    after(:create) do |drive, evaluator|
      create_list(:drive_date, evaluator.drive_dates_count, drive: drive)
    end

    factory :drive_with_location do
      ignore do
        locations_count 1
      end

      after(:create) do |drive, evaluator|
        create_list(:drive_location, evaluator.locations_count, drive: drive)
      end
    end

    factory :drive_with_slots_and_appointments do
      appointments_available_per_slot 2

      ignore do
        drive_slots_count 2
      end

      after(:create) do |drive, evaluator|
        create_list(:drive_slot, evaluator.drive_slots_count, drive: drive)
      end
    end
  end
end
