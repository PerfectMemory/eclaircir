FactoryBot.define do
  factory :status, class: Clarifier::Status do
    code { rand(10_000..20_000) }
    description { Faker::Lorem.sentence }
    initialize_with { Clarifier::Status.new(attributes) }
  end
end