module Satrap
  module Request
    class Trust < Base

      def uri
        URI.parse('https://w3s.wmtransfer.com/asp/XMLTrustList2.asp')
      end

      private

      def builder
        Nokogiri::XML::Builder.new do |x|
          x.send('w3s.request') do
            x.reqn reqn
            x.wmid signer.wmid
            x.sign signature
            x.gettrustlist do
              x.wmid opts[:wmid]
            end
          end
        end
      end

      def signed_string
        "#{opts[:wmid]}#{reqn}"
      end
    end
  end
end
