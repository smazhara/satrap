require 'spec_helper'

describe Satrap::Response::BusinessLevel do
  let(:business_level) { describe_class.new(http_response) }

  let :http_response do
    double :http_response,
      body: response_body
  end

  let :response_body do
  end

  describe '#value' do
    subject { business_level.value }
  end
end
