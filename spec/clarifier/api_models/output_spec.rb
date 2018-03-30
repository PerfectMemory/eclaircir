require 'spec_helper'

describe Clarifier::Output do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      'id' => 'ea68cac87c304b28a8046557062f34a0',
      'status' => {
        'code' => 10000,
        'description' => 'Ok',
      },
      'created_at' => '2016-11-22T16:50:25Z',
      'model' => {
        'name' => 'general-v1.3',
        'id' => 'aaa03c23b3724a16a56b629203edc62c',
        'created_at' => '2016-03-09T17:11:39Z',
        'app_id' => nil,
        'output_info' => {},
        'model_version' => {}
      },
      'input' => {
        'id' => 'ea68cac87c304b28a8046557062f34a0',
        'data' => {
          'image' => {}
        }
      },
      'data' => {
        'concepts' => []
      }
    }
  end

  its(:id) { is_expected.to eq 'ea68cac87c304b28a8046557062f34a0' }
  its(:status) { is_expected.to be_a Clarifier::Status }
  its(:created_at) { is_expected.to eq DateTime.new(2016, 11, 22, 16, 50, 25) }
  its(:model) { is_expected.to be_a Clarifier::Model }
  its(:input) { is_expected.to be_a Clarifier::Input }
  its(:data) { is_expected.to be_a Clarifier::Data }
end
