require 'spec_helper'

describe Eclaircir::Input do
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
  its(:data) { is_expected.to be_a Eclaircir::Data }

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

  describe '.from_url' do
    before do
      allow(described_class)
        .to receive(:new)
        .with(data: fake_data)
        .and_return(fake_image)

      allow(Eclaircir::Data)
        .to receive(:new)
        .with(image: fake_media)
        .and_return(fake_data)

      allow(Eclaircir::Media)
        .to receive(:new)
        .with(url: 'http://example.com/lol.jpg')
        .and_return(fake_media)
    end

    let(:fake_image) do
      instance_double(described_class)
    end

    let(:fake_data) do
      instance_double(Eclaircir::Data)
    end

    let(:fake_media) do
      instance_double(Eclaircir::Media)
    end

    it 'builds and returns an image with the right url' do
      expect(described_class.from_url('http://example.com/lol.jpg')).to be fake_image
    end
  end
end