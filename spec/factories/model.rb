FactoryBot.define do
  factory :model, class: Clarifier::Model do
    id { Faker::Base.regexify(%r/[a-f0-9]{32}/) }
    name { Faker::Food.ingredient }
    created_at { DateTime.now }
    app_id nil
    initialize_with { Clarifier::Model.new(attributes) }
  end
end