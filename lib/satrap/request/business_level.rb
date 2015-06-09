module Satrap
  module Request
    class BusinessLevel
      def initialize(signer, opts)
        @signer = signer
        @opts = opts
      end

      def xml
        builder.to_xml
      end

      def uri
        URI.parse('https://stats.wmtransfer.com/levels/XMLWMIDLevel.aspx')
      end

      def response_class
        Response::BusinessLevel
      end

      private

      def builder
        Nokogiri::XML::Builder.new do |x|
          x.send('WMIDLevel.request') do
            x.signerwmid @signer.wmid
            x.wmid @opts[:wmid]
          end
        end
      end
    end
  end
end