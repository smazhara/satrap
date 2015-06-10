require 'spec_helper'

describe Satrap::HttpClient do
  describe '.make' do
    subject { described_class.make(request) }

    let :request do
      Satrap::Request::Passport.new(signer, wmid: signer.wmid)
    end

    it do
      subject
    end
  end
end
