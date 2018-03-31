FactoryBot.define do
  factory :media, class: Eclaircir::Media do
    url { Faker::Internet.url }
    initialize_with { Eclaircir::Media.new(attributes) }
  end
end