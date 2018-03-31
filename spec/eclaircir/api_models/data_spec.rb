require 'spec_helper'

describe Clarifier::Data do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      'concepts' => concepts,
      'image' => image,
    }
  end

  let(:concepts) do
    [
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
    ]
  end

  let(:image) do
    {
      'url' => 'https://samples.clarifai.com/metro-north.jpg',
    }
  end

  its(:image) { is_expected.to be_a Clarifier::Media }
  its(:concepts) { is_expected.to all(be_a(Clarifier::Concept)) }

  describe '#to_api_hash' do
    it 'returns the right hash' do
      expect(subject.to_api_hash).to eq({
        concepts: [
          {
            id: 'ai_HLmqFqBf',
            name: 'train',
            app_id: nil,
            value: 0.9989112
          },
          {
            id: 'ai_fvlBqXZR',
            name: 'railway',
            app_id: nil,
            value: 0.9975532
          }
        ],
        image: {
          url: 'https://samples.clarifai.com/metro-north.jpg'
        }
      })
    end

    context 'when the image is not provided' do
      let(:image) do
        nil
      end

      it 'returns the right hash' do
        expect(subject.to_api_hash).to eq({
          concepts: [
            {
              id: "ai_HLmqFqBf",
              name: "train",
              app_id: nil,
              value: 0.9989112
            },
            {
              id: "ai_fvlBqXZR",
              name: "railway",
              app_id: nil,
              value: 0.9975532
            }
          ]
        })
      end
    end

    context 'when the concepts are not provided' do
      let(:concepts) do
        nil
      end

      it 'returns the right hash' do
        expect(subject.to_api_hash).to eq({
          concepts: [],
          image: {
            url: 'https://samples.clarifai.com/metro-north.jpg'
          }
        })
      end
    end
  end
end
