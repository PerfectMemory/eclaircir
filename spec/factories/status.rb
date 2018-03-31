FactoryBot.define do
  factory :status, class: Eclaircir::Status do
    code { rand(10_000..20_000) }
    description { Faker::Lorem.sentence }
    initialize_with { Eclaircir::Status.new(attributes) }
  end
end