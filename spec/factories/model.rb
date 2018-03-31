FactoryBot.define do
  factory :model, class: Eclaircir::Model do
    id { Faker::Base.regexify(%r/[a-f0-9]{32}/) }
    name { Faker::Food.ingredient }
    created_at { DateTime.now }
    app_id nil
    initialize_with { Eclaircir::Model.new(attributes) }
  end
end