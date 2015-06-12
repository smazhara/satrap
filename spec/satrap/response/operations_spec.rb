require 'spec_helper'

describe Response::Operations do
  subject { described_class.new(raw) }

  let :raw do
    <<-XML
      <?xml version="1.0" encoding="windows-1251"?>
      <w3s.response>
        <reqn>1433971686127</reqn>
        <operations cnt="2" cntA="0">
        #{op1}
        #{op2}
        </operations>
        <retval>0</retval>
        <retdesc></retdesc>
        <ser>S</ser>
      </w3s.response>
    XML
  end

  let(:op1) { '<operation>1</operation>' }
  let(:op2) { '<operation>2</operation>' }

  its(:count) { should eq 2 }
end
