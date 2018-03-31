require 'spec_helper'

describe Eclaircir::Media do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      'url' => 'https://samples.clarifai.com/metro-north.jpg',
      'base64' => "dGVzdA==\n",
    }
  end

  its(:url) { is_expected.to eq 'https://samples.clarifai.com/metro-north.jpg' }
  its(:base64) { is_expected.to eq "dGVzdA==\n" }
end
