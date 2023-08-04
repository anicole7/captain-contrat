FactoryBot.define do
  factory :champion do
    sequence(:name) { |i| "Champion#{i}" }
    HealthPoint { 100 }
    sequence(:attackPoint) { |i| i * 10 }
  end
end
