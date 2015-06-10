require 'spec_helper'

describe Satrap::Request::Passport do
  let(:request) { described_class.new(signer, opts) }

  let :signer do
    double :signer,
      wmid: '111111111111'
  end

  let :opts do
    {
      wmid: '222222222222'
    }
  end

  describe '#xml' do
    subject { request.xml }

    it do
      should eq <<-XML.strip_heredoc
        <?xml version="1.0"?>
        <request>
          <wmid>111111111111</wmid>
          <passportwmid>222222222222</passportwmid>
          <params>
            <dict>0</dict>
            <info>1</info>
            <mode>0</mode>
          </params>
          <sign/>
        </request>
      XML
    end
  end
end
