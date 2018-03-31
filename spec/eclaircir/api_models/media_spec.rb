require 'spec_helper'

describe Clarifier::Media do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      'url' => 'https://samples.clarifai.com/metro-north.jpg',
    }
  end

  its(:url) { is_expected.to eq 'https://samples.clarifai.com/metro-north.jpg' }
end
