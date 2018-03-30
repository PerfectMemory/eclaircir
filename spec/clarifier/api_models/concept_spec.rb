require 'spec_helper'

describe Clarifier::Concept do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      'id' => 'ai_HLmqFqBf',
      'name' => 'train',
      'app_id' => 'blah',
      'value' => 0.9989112,
    }
  end

  its(:id) { is_expected.to eq 'ai_HLmqFqBf' }
  its(:name) { is_expected.to eq 'train' }
  its(:app_id) { is_expected.to eq 'blah' }
  its(:value) { is_expected.to eq 0.9989112 }

  describe '#to_api_hash' do
    it 'returns the right hash' do
      expect(subject.to_api_hash).to eq({
        id: 'ai_HLmqFqBf',
        name: 'train',
        app_id: 'blah',
        value: 0.9989112,
      })
    end
  end
end