FactoryBot.define do
  factory :concept, class: Eclaircir::Concept do
    id { Faker::Base.regexify(%r/ai_[A-z0-9]{8}/) }
    name { Faker::Food.ingredient }
    value { rand(0.4..1.0).round(7) }
    initialize_with { Eclaircir::Concept.new(attributes) }
  end
end