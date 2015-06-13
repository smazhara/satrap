# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Request::Operations do
  let(:operations) { described_class.new(signer, opts) }
  let(:opts) { '' }

  let :signer do
    double :signer,
      wmid: '111111111111'
  end

  describe '#xml' do
    subject { operations.xml }

    let :opts do
      {
        wmid: '111111111111',
        purse: 'Z123456789012',
        tranid: 123456,
        wminvid: 654321,
        orderid: 987654,
        datestart: Time.parse('2012-01-02 12:34:56'),
        datefinish: Time.parse('2012-02-02 12:34:56')
      }
    end

    before do
      allow(operations.signer).to receive(:sign) { 'SIGN' }
      Timecop.freeze Time.parse('2013-02-02 12:34:56')
    end

    it do
      expect(operations.signer).to receive(:sign)
        .with('Z1234567890121359837296000')
      subject
    end

    it do
      should eq <<-XML.strip_heredoc
        <?xml version="1.0"?>
        <w3s.request>
          <reqn>1359837296000</reqn>
          <wmid>111111111111</wmid>
          <sign>SIGN</sign>
          <getoperations>
            <purse>Z123456789012</purse>
            <tranid>123456</tranid>
            <wminvid>654321</wminvid>
            <orderid>987654</orderid>
            <datestart>20120102 12:34:56</datestart>
            <datefinish>20120202 12:34:56</datefinish>
          </getoperations>
        </w3s.request>
      XML
    end
  end
end
