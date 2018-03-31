FactoryBot.define do
  factory :input, class: Eclaircir::Input do
    id { Faker::Base.regexify(%r/[a-f0-9]{32}/) }
    data { build(:data, :image) }
    initialize_with { Eclaircir::Input.new(attributes) }
  end
end