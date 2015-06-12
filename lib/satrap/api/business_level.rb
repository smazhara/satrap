# api = Satrap::Api::BusinessLevel.new(wmid: '111')
# api.success?
# api.request # Satrap::Request::BusinessLevel
# api.response # Satrap::Response::BusinessLevel
module Satrap
  module Api
    class BusinessLevel < Base
      private

      def uri
        URI.parse('https://stats.wmtransfer.com/levels/XMLWMIDLevel.aspx')
      end
    end
  end
end
