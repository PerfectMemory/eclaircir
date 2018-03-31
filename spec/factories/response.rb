FactoryBot.define do
  factory :response, class: Eclaircir::Response do
    status { build(:status) }
    outputs { build_list(:output, 1) }
    initialize_with { Eclaircir::Response.new(attributes) }
  end
end