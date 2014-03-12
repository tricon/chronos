# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :drive_slot do
    slot_at "2014-03-04 17:43:41"
    drive nil

    ignore do
      drive_appointments_count 2
    end

    after(:create) do |drive_slot, evaluator|
      create_list(:drive_appointment, evaluator.drive_appointments_count, drive_slot: drive_slot)
    end
  end
end
