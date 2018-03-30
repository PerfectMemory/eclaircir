require 'spec_helper'

describe Clarifier::Input do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      'id' => 'ea68cac87c304b28a8046557062f34a0',
      'data' => {
        'image' => {
        'url' => "https://samples.clarifai.com/metro-north.jpg",
        },
      },
    }
  end

  its(:id) { is_expected.to eq 'ea68cac87c304b28a8046557062f34a0' }
  its(:data) { is_expected.to be_a Clarifier::Data }

  describe '#to_api_hash' do
    it 'returns the right hash' do
      expect(subject.to_api_hash).to eq({
        id: 'ea68cac87c304b28a8046557062f34a0',
        data: {
          image: {
            url: 'https://samples.clarifai.com/metro-north.jpg'
          },
          concepts: []
        }
      })
    end
  end
end