# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Satrap::Response::Passport do
  let(:passport) { described_class.new(raw_response) }

  subject { passport }

  let :raw_response do
    ERB.new(File.read('spec/fixtures/passport.xml.erb')).result(binding)
  end
  let(:response_fullaccess) { '0' }

  describe '#fullaccess?' do
    subject { passport.fullaccess? }

    context 'when /response/fullaccess = 0' do
      let(:response_fullaccess) { '0' }
      it { should be false }
    end

    context 'when /response/fullaccess = 1' do
      let(:response_fullaccess) { '1' }
      it { should be true }
    end
  end

  its(:wmids) { should have(2).wmid }
end
