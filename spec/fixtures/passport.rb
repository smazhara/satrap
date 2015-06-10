require 'spec_helper'

describe Satrap::Response::Passport do
  let(:response) { described_class.new(body) }

  let :body do
    <<-XML
    XML
  end

  its(:fullaccess?) { should be false }
  it do
    puts response
  end
end
