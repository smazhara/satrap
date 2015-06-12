# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Request::Trust do
  let(:trust) { Request::Trust.new(signer, opts) }

  let :signer do
    double :signer,
      wmid: '111111111111'
  end

  let :opts do
    {
      wmid: '222222222222'
    }
  end

  before do
    allow(signer).to receive(:sign) { 'SIGN' }
    allow(trust).to receive(:reqn) { 'REQN' }
  end

  describe '#xml' do
    subject { trust.xml }

    it do
      should eq <<-XML.strip_heredoc
        <?xml version="1.0"?>
        <w3s.request>
          <reqn>REQN</reqn>
          <wmid>111111111111</wmid>
          <sign>SIGN</sign>
          <gettrustlist>
            <wmid>222222222222</wmid>
          </gettrustlist>
        </w3s.request>
      XML
    end
  end
end
