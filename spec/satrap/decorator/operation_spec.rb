require 'spec_helper'

describe Decorator::Operation do
  let(:model) { operation_class.new }

  let :operation_class do
    Class.new do
      include Decorator::Operation
    end
  end

  describe '#complete?' do
    subject { model.complete? }

    before do
      def model.opertype; end # suppress undefined method warning
      allow(model).to receive(:opertype) { opertype }
    end

    context 'when opertype = 0' do
      let(:opertype) { 0 }
      it { should be true }
    end

    context 'when opertype != 0' do
      let(:opertype) { [-4, -12].sample }
      it { should be false }
    end
  end

  describe '#wminvid?' do
    subject { model.wminvid? }

    before do
      def model.wminvid; end # suppress undefined method warning
      allow(model).to receive(:wminvid) { wminvid }
    end
    let(:wminvid) { 1 }

    context 'when wminvid > 0' do
      let(:wminvid) { rand(999_999_999) + 1 }
      it { should be true }
    end

    context 'when wminvid = 0' do
      let(:wminvid) { 0 }
      it { should be false }
    end
  end
end
