require 'spec_helper'

describe Eclaircir::Model do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      'id' => 'aaa03c23b3724a16a56b629203edc62c',
      'name' => 'general-v1.3',
      'created_at' => '2016-03-09T17:11:39Z',
      'app_id' => 'blah',
      'output_info' => output_info,
      'model_version' => model_version
    }
  end

  let(:output_info) do
    {
      'message' => 'Show output_info with: GET /models/{model_id}/output_info',
      'type' => 'concept'
    }
  end

  let(:model_version) do
    {
      'id' => 'aa9ca48295b37401f8af92ad1af0d91d',
      'created_at' => '2016-07-13T01:19:12Z',
      'status' => {
        'code' => 21100,
        'description' => 'Model trained successfully',
      }
    }
  end

  its(:id) { is_expected.to eq 'aaa03c23b3724a16a56b629203edc62c' }
  its(:name) { is_expected.to eq 'general-v1.3' }
  its(:created_at) { is_expected.to eq DateTime.new(2016, 3, 9, 17, 11, 39) }
  its(:app_id) { is_expected.to eq 'blah' }
  its(:output_info) { is_expected.to eq output_info }
  its(:model_version) { is_expected.to eq model_version }

  describe '#predict_outputs' do
    before do
      allow(Eclaircir)
        .to receive(:new_client)
        .and_return(fake_client)
    end

    let(:fake_client) do
      instance_double(Eclaircir::Client)
    end

    before do
      allow(Eclaircir::Utilities::InputParser)
        .to receive(:parse)
        .with(input_params)
        .and_return(fake_input)

      expect(fake_client)
        .to receive(:predict_outputs)
        .with(subject, fake_input)
        .and_return(predicted_outputs)
    end

    let(:input_params) do
      instance_double(Hash)
    end

    let(:fake_input) do
      instance_double(Eclaircir::Input)
    end

    let(:predicted_outputs) do
      instance_double(Eclaircir::Response)
    end

    it 'returns the clients response' do
      expect(subject.predict_outputs(input_params)).to be predicted_outputs
    end
  end
end
