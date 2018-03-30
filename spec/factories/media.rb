FactoryBot.define do
  factory :media, class: Clarifier::Media do
    url { Faker::Internet.url }
    initialize_with { Clarifier::Media.new(attributes) }
  end
end