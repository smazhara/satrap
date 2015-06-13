require 'spec_helper'

describe Response::Wmid do
  subject { Response::Wmid.new(raw) }

  let :raw do
    <<-XML
      <row admlocked="0" cid="7663" datecrt="2003-08-02T22:02:52.090"
        datediff="4330" dateupd="2015-06-03T20:31:44.643" locked="1"
        notary="0" recalled="0" regcid="1129"
        regnickname="  webmoney.com.ua" regwmid="180281227322"
        status="11" tid="130">
      </row>
    XML
  end

  its(:admlocked) { should eq 0 }
  its(:datecrt) { should eq Time.parse('2003-08-02 18:02:52.090 UTC') }
end
