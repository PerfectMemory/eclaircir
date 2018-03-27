require 'spec_helper'

describe Clarifier::Model do
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
end
