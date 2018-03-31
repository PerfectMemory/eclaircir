require 'spec_helper'

describe Eclaircir do
  describe '.configuration' do
    it 'returns a new configuration' do
      expect(described_class.configuration).to be_a Eclaircir::Configuration
    end
  end

  describe '.configure' do
    before do
      allow(described_class)
        .to receive(:configuration)
        .and_return(fake_configuration)
    end

    let(:fake_configuration) do
      instance_double(Eclaircir::Configuration)
    end

    it 'yields the configuration' do
      expect do |b|
        described_class.configure(&b)
      end.to yield_with_args(fake_configuration)
    end
  end

  describe '.new_client' do
    before do
      allow(described_class)
        .to receive(:configuration)
        .and_return(fake_configuration)
    end

    let(:fake_configuration) do
      instance_double(Eclaircir::Configuration,
        api_key: 'xxx')
    end

    before do
      expect(Eclaircir::Client)
        .to receive(:new)
        .with('xxx')
        .and_return(fake_client)
    end

    let(:fake_client) do
      instance_double(Eclaircir::Client)
    end

    it 'builds and returns the client correctly' do
      expect(described_class.new_client).to be fake_client
    end
  end
end