# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Satrap::Request::BusinessLevel do
  let(:request) { described_class.new(signer, opts) }

  let :signer do
    double :signer,
      wmid: signer_wmid
  end

  let(:signer_wmid) { '111111111111' }

  let :opts do
    {
      wmid: tested_wmid
    }
  end

  let(:tested_wmid) { '222222222222' }

  describe '#xml' do
    subject { request.xml }

    it do
      should eq <<-XML.strip_heredoc
        <?xml version="1.0"?>
        <WMIDLevel.request>
          <signerwmid>111111111111</signerwmid>
          <wmid>222222222222</wmid>
        </WMIDLevel.request>
      XML
    end
  end
end
