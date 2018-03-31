require 'spec_helper'

describe Eclaircir::Utilities::InputParser do
  subject do
    described_class.new(params)
  end

  let(:params) do
    {
    }
  end

  describe '#input' do
    context 'when no input is provided' do
      it 'raises an ArgumentError' do
        expect do
          subject.input
        end.to raise_error(ArgumentError, /Exactly one kind of inputs should be provided/)
      end
    end

    context 'when more than one input type is provided' do
      let(:params) do
        {
          url: 'xxx',
          content: 'xxx',
        }
      end

      it 'raises an ArgumentError' do
        expect do
          subject.input
        end.to raise_error(ArgumentError, /Exactly one kind of inputs should be provided/)
      end
    end

    context 'when we provide an input' do
      let(:params) do
        {
          input: input,
        }
      end

      let(:input) do
        instance_double(Eclaircir::Input)
      end

      it 'returns the same inputs' do
        expect(subject.input).to eq [input]
      end
    end

    context 'when we provide an url' do
      let(:params) do
        {
          url: url,
        }
      end

      let(:url) do
        instance_double(String)
      end

      before do
        expect(Eclaircir::Input)
          .to receive(:from_url)
          .with(url)
          .and_return(built_input)
      end

      let(:built_input) do
        instance_double(Eclaircir::Input)
      end

      it 'returns built inputs' do
        expect(subject.input).to eq [built_input]
      end
    end

    context 'when we provide an io' do
      let(:params) do
        {
          io: io,
        }
      end

      let(:io) do
        instance_double(IO)
      end

      before do
        expect(Eclaircir::Input)
          .to receive(:from_io)
          .with(io)
          .and_return(built_input)
      end

      let(:built_input) do
        instance_double(Eclaircir::Input)
      end

      it 'returns built inputs' do
        expect(subject.input).to eq [built_input]
      end
    end

    context 'when we provide a path' do
      let(:params) do
        {
          path: path,
        }
      end

      let(:path) do
        instance_double(String)
      end

      before do
        expect(Eclaircir::Input)
          .to receive(:from_path)
          .with(path)
          .and_return(built_input)
      end

      let(:built_input) do
        instance_double(Eclaircir::Input)
      end

      it 'returns built inputs' do
        expect(subject.input).to eq [built_input]
      end
    end

    context 'when we provide a base64' do
      let(:params) do
        {
          base64: base64,
        }
      end

      let(:base64) do
        instance_double(String)
      end

      before do
        expect(Eclaircir::Input)
          .to receive(:from_base64)
          .with(base64)
          .and_return(built_input)
      end

      let(:built_input) do
        instance_double(Eclaircir::Input)
      end

      it 'returns built inputs' do
        expect(subject.input).to eq [built_input]
      end
    end

    context 'when we provide a content' do
      let(:params) do
        {
          content: content,
        }
      end

      let(:content) do
        instance_double(String)
      end

      before do
        expect(Eclaircir::Input)
          .to receive(:from_content)
          .with(content)
          .and_return(built_input)
      end

      let(:built_input) do
        instance_double(Eclaircir::Input)
      end

      it 'returns built inputs' do
        expect(subject.input).to eq [built_input]
      end
    end
  end

  describe '.parse' do
    before do
      allow(described_class)
        .to receive(:new)
        .with(input_params)
        .and_return(input_parser)
    end

    let(:input_params) do
      instance_double(Hash)
    end

    let(:input_parser) do
      instance_double(described_class,
        input: fake_input)
    end

    let(:fake_input) do
      instance_double(Array)
    end

    it 'builds an input parser and uses it to parse' do
      expect(described_class.parse(input_params)).to be fake_input
    end
  end
end