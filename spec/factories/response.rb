FactoryBot.define do
  factory :response, class: Clarifier::Response do
    status { build(:status) }
    outputs { build_list(:output, 1) }
    initialize_with { Clarifier::Response.new(attributes) }
  end
end