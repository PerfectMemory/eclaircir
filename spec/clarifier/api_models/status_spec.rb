require 'spec_helper'

describe Clarifier::Status do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      'code' => 10_000,
      'description' => 'Ok',
    }
  end

  its(:code) { is_expected.to eq 10_000 }
  its(:description) { is_expected.to eq 'Ok' }
end
