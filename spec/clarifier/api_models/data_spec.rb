require 'spec_helper'

describe Clarifier::Data do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      'concepts' => [
        {
          'id' => 'ai_HLmqFqBf',
          'name' => 'train',
          'app_id' => nil,
          'value' => 0.9989112
        },
        {
          'id' => 'ai_fvlBqXZR',
          'name' => 'railway',
          'app_id' => nil,
          'value' => 0.9975532
        }
      ],
      'image' => {
        'url' => 'https://samples.clarifai.com/metro-north.jpg',
      },
    }
  end

  its(:image) { is_expected.to be_a Clarifier::Media }
  its(:concepts) { is_expected.to all(be_a(Clarifier::Concept)) }
end
