FactoryBot.define do
  factory :data, class: Eclaircir::Data do
    trait :image do
      image { build(:media) }
    end

    trait :with_concepts do
      concepts { build_list(:concept, 3) }
    end

    initialize_with { Eclaircir::Data.new(attributes) }
  end
end