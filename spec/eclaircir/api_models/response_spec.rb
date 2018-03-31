require 'spec_helper'

describe Eclaircir::Response do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      'status' => {
        'code' => 10000,
        'description' => 'Ok',
      },
      'outputs' => [
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
      ]
    }
  end

  its(:status) { is_expected.to be_a Eclaircir::Status }
  its(:outputs) { is_expected.to all(be_a(Eclaircir::Output)) }

  describe '.parse' do
    before do
      allow(described_class)
        .to receive(:new)
        .with(params)
        .and_return(fake_response)
    end

    let(:fake_response) do
      instance_double(described_class)
    end

    it 'returns the built response' do
      expect(described_class.parse(params)).to be fake_response
    end
  end
end
