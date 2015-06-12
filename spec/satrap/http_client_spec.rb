require 'spec_helper'

describe Satrap::HttpClient do
  describe '.call' do
    subject { described_class.call(uri, xml) }

    let :operations do
      Satrap::Request::Operations.new(
        signer,
        purse: 'Z849446636219',
        datestart: Time.parse('2015-05-01'),
        datefinish: Time.parse('2015-06-01')
      )
    end

    let :trust do
      Request::Trust.new(
        signer,
        wmid: '594703857856'
      )
    end

    let :request do
      trust
    end

    let(:uri) { request.uri }
    let(:xml) { request.xml }

    it do
#      puts subject.body
    end
  end
end
