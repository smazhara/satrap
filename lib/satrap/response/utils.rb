module Satrap
  module Response
    module Utils
      extend Memoist

      def initialize(http_response)
        @http_response = http_response
      end

      def success?
        http_response.is_a?(Net::HTTPSuccess)
      end

      def xml
        Nokogiri::XML(http_response.body)
      end
      memoize :xml
    end
  end
end
