require 'spec_helper'

describe Response::Trusts do
  let(:model) { Response::Trusts.new(raw) }

  subject { model }

  let :raw do
    <<-XML
    <?xml version="1.0"?>
    <w3s.response>
      <reqn>1434064432056</reqn>
      <trustlist cnt="1">
        <trust>1</trust>
        <trust>2</trust>
      </trustlist>
      <retval>0</retval>
      <retdesc></retdesc>
    </w3s.response>
    XML
  end

  its(:reqn) { should eq 1434064432056 }
  its(:count) { should eq 2 }
end
