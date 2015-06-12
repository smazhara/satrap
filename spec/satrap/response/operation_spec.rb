# encoding: utf-8
require 'spec_helper'

describe Response::Operation do
  let(:operation) { described_class.new(raw) }

  subject { operation }


  context 'when regular transfer' do
    let :raw do
      <<-XML
        <operation id="1193153903" ts="1193153901">
          <pursesrc>Z111111111111</pursesrc>
          <pursedest>Z222222222222</pursedest>
          <amount>100.00</amount>
          <comiss>0.80</comiss>
          <opertype>0</opertype>
          <wminvid>48934792</wminvid>
          <orderid>9384758</orderid>
          <tranid>66850999</tranid>
          <period>0</period>
          <desc>Проверка связи</desc>
          <datecrt>20150520 22:46:19</datecrt>
          <dateupd>20150520 22:46:21</dateupd>
          <corrwm>333333333333</corrwm>
          <rest>1367.97</rest>
        </operation>
      XML
    end

    its(:id) { should eq 1193153903 }
    its(:ts) { should eq 1193153901 }
    its(:pursesrc) { should eq 'Z111111111111' }
    its(:pursedest) { should eq 'Z222222222222' }
    its(:amount) { should eq BigDecimal.new('100.00') }
    its(:comiss) { should eq BigDecimal.new('0.80') }
    its(:opertype) { should eq 0 }
    its(:wminvid) { should eq 48934792 }
    its(:orderid) { should eq 9384758 }
    its(:tranid) { should eq 66850999 }
    its(:period) { should eq 0 }
    its(:desc) { should eq 'Проверка связи' }
    its(:datecrt) { should eq Time.parse('2015-05-20 19:46:19 UTC') }
    its(:dateupd) { should eq Time.parse('2015-05-20 19:46:21 UTC') }
    its(:corrwm) { should eq '333333333333' }
    its(:rest) { should eq BigDecimal.new('1367.97') }
  end

  context 'when refund' do
    let :raw do
      <<-XML
        <operation id="1193157939" ts="1193157939">
          <pursesrc>Z1111111111111</pursesrc>
          <pursedest>Z222222222222</pursedest>
          <amount>100.00</amount>
          <comiss>0.00</comiss>
          <opertype>0</opertype>
          <wminvid>0</wminvid>
          <orderid>0</orderid>
          <tranid>1193153903</tranid>
          <period>0</period>
          <desc>Moneyback transaction WMTranId: 1193153903. (Проверка связи)</desc>
          <datecrt>20150520 23:01:13</datecrt>
          <dateupd>20150520 23:01:13</dateupd>
          <corrwm>333333333333</corrwm>
          <rest>1467.97</rest>
        </operation>
      XML
    end
  end
end
