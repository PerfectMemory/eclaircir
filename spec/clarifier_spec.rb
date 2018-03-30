require 'spec_helper'

describe Clarifier do
  describe '.configuration' do
    it 'returns a new configuration' do
      expect(described_class.configuration).to be_a Clarifier::Configuration
    end
  end

  describe '.configure' do
    before do
      allow(described_class)
        .to receive(:configuration)
        .and_return(fake_configuration)
    end

    let(:fake_configuration) do
      instance_double(Clarifier::Configuration)
    end

    it 'yields the configuration' do
      expect do |b|
        described_class.configure(&b)
      end.to yield_with_args(fake_configuration)
    end
  end
end