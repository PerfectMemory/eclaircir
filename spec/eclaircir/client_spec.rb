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

  describe '#predict_outputs' do
    before do
      stub_request(:post, 'https://api.clarifai.com/v2/models/blah/outputs')
        .with(
          headers: {
            'Content-Type' => 'application/json',
            'Authorization' => 'Key xxx',
          },
          body: {
            'inputs' => [
              {
                'data' => {
                  'image' => {
                    'url' => 'http://example.com/lol.jpg'
                  },
                  'concepts' => []
                }
              }
            ]
          }.to_json)
        .to_return(status: status, body: body)
    end

    let(:predicted_outputs) do
      subject.predict_outputs(model, input)
    end

    let(:model) do
      build(:model, id: 'blah')
    end

    let(:input) do
      Clarifier::Input.new(
        data: Clarifier::Data.new(
          image: Clarifier::Media.new(
            url: 'http://example.com/lol.jpg')))
    end

    context 'when the status code is 2xx' do
      let(:status) do
        201
      end

      let(:body) do
        load_fixture('predict_outputs/success.json')
      end

      before do
        allow(Clarifier::Response)
          .to receive(:parse)
          .with(JSON.parse(body))
          .and_return(fake_response)

        allow(Clarifier::Client::StatusValidator)
          .to receive(:new)
          .with(fake_response)
          .and_return(status_validator)
      end

      let(:fake_response) do
        instance_double(Clarifier::Response)
      end

      let(:status_validator) do
        instance_double(Clarifier::Client::StatusValidator,
          validate!: true)
      end

      it 'returns a parsed response' do
        expect(predicted_outputs).to be fake_response
      end

      it 'delegates the response to the status validator' do
        expect(status_validator).to receive(:validate!)

        predicted_outputs
      end
    end

    context 'when the status code is not 2xx' do
      let(:status) do
        400
      end

      let(:body) do
        load_fixture('predict_outputs/invalid_request.json')
      end

      it 'raises a Clarifier::APIError with the status message' do
        expect do
          predicted_outputs
        end.to raise_error(Clarifier::APIError, /Invalid request/)
      end
    end
  end
end