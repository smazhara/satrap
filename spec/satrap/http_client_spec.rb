require 'spec_helper'

describe Satrap::HttpClient do
  let(:client) { described_class.new(request) }

  let :signer do
    Satrap::Signer.new(ENV['WMID'], ENV['WMID_PASSWORD'], ENV['WMID_KEY'])
  end

  it do
  end
end
