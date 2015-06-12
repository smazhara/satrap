# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Response::Trust do
  let(:model) { Response::Trust.new(raw) }

  let :raw do
    <<-XML
      <trust id="3809" inv="0" trans="0" purse="1" transhist="0" MsgHist="0"
          Msg="0" auth="4">
        <purse>C444444444444</purse>
        <master>8888888888888</master>
        <daylimit>12.34</daylimit>
        <dlimit>34.56</dlimit>
        <wlimit>65.43</wlimit>
        <mlimit>32.54</mlimit>
        <dsum>0.00</dsum>
        <wsum>0.00</wsum>
        <msum>0.00</msum>
        <lastsumdate>2007.09.12</lastsumdate>
        <storeswmid></storeswmid>
        <amount>0</amount>
      </trust>
    XML
  end

  describe Response::Trust::Standard do
    subject { model }

    its(:id) { should eq 3809 }
    its(:inv) { should eq 0 }
    its(:trans) { should eq 0 }
    its(:balance) { should eq 1 }
    its(:transhist) { should eq 0 }
    its(:msg_hist) { should eq 0 }

    its(:purse) { should eq 'C444444444444' }
    its(:daylimit) { should eq BigDecimal.new('12.34') }
  end

  describe "#balance?" do
  end
end
