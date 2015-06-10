require 'spec_helper'

describe Satrap::Response::BusinessLevel do
  let(:business_level) { described_class.new(raw) }

  let :raw do
    <<-XML.strip_heredoc
      <?xml version="1.0"?>
      <WMIDLevel.response>
        <level>70</level>
        <retval>0</retval>
      </WMIDLevel.response>
    XML
  end

  describe '#value' do
    subject { business_level.value }
    it { should eq 70 }
  end
end
