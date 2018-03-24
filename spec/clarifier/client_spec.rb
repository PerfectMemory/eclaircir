require 'spec_helper'

describe Clarifier::Client do
  subject do
    described_class.new(api_key)
  end

  let(:api_key) do
    'xxx'
  end

  describe '#models' do
    before do
      stub_request(:get, 'https://api.clarifai.com/v2/models')
        .with(headers: {
          'Content-Type' => 'application/json',
          'Authorization' => 'Key xxx',
        })
    end

    it 'uses the right authorization header' do
      expect do
        subject.models
      end.not_to raise_error
    end
  end
end