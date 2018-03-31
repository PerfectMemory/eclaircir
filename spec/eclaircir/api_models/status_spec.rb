require 'spec_helper'

describe Eclaircir::Status do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
      'code' => code,
      'description' => 'Ok',
    }
  end

  let(:code) do
    10_000
  end

  its(:code) { is_expected.to eq 10_000 }
  its(:description) { is_expected.to eq 'Ok' }

  describe '#success?' do
    context 'when the code is Status::SUCCESS' do
      its(:success?) { is_expected.to be true }
    end

    context 'when the code is not Status::SUCCESS' do
      let(:code) do
        10_020
      end

      its(:success?) { is_expected.to be false }
    end
  end

  describe '#validate!' do
    context 'when the code is Status::SUCCESS' do
      it 'returns true' do
        expect(subject.validate!).to be true
      end
    end

    context 'when the code has a specific error' do
      let(:code) do
        30_300
      end

      it 'raises the specific error with the description' do
        expect do
          subject.validate!
        end.to raise_error(Eclaircir::ImageDecodingError, /Ok/)
      end
    end

    context 'when the code is not managed' do
      let(:code) do
        99_999
      end

      it 'raises an APIError' do
        expect do
          subject.validate!
        end.to raise_error(Eclaircir::APIError, /Ok/)
      end
    end
  end
end
