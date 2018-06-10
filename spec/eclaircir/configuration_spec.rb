require 'spec_helper'

describe Eclaircir::Configuration do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      env: env,
      api_key: api_key,
    }
  end

  let(:env) do
    {}
  end

  let(:api_key) do
    'xyzzy'
  end

  describe '#api_key' do
    context 'when the api_key is provided explicitely' do
      it 'returns provided api_key' do
        expect(subject.api_key).to eq 'xyzzy'
      end
    end

    context 'when the api_key is not provided explicitely' do
      let(:api_key) do
        nil
      end

      context 'when the CLARIFAI_API_KEY env var is provided' do
        let(:env) do
          {
            'CLARIFAI_API_KEY' => 'xxx'
          }
        end

        it 'returns the CLARIFAI_API_KEY env var value' do
          expect(subject.api_key).to eq 'xxx'
        end
      end

      context 'when the CLARIFAI_API_KEY env var is not provided' do
        its(:api_key) { is_expected.to be_nil }
      end
    end
  end

  describe '#api_key=' do
    it 'changes the api_key' do
      expect { subject.api_key = 'yoloswag' }.to change { subject.api_key }
    end

    it 'sets the right value' do
      subject.api_key = 'yoloswag'

      expect(subject.api_key).to eq 'yoloswag'
    end
  end
end