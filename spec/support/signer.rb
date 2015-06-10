module Satrap
  module SharedContexts
    extend RSpec::SharedContext

    let :signer do
      Satrap::Signer.new(
        ENV['WMID'], ENV['WMID_PASSWORD'], ENV['WMID_KEY']
      )
    end
  end
end
