require 'spec_helper'

describe Satrap::Response::Passport do
  let(:passport) { described_class.new(raw_response) }

  let :raw_response do
    ERB.new(File.read('spec/fixtures/passport.xml.erb')).result(binding)
  end

  describe '#full_access?' do
    subject { passport.full_access? }

    context 'when /response/fullaccess = 0' do
      let(:response_fullaccess) { '0' }
      it { should be false }
    end

    context 'when /response/fullaccess = 1' do
      let(:response_fullaccess) { '1' }
      it { should be true }
    end
  end
end
