module Satrap
  module Request
    class Operations < Base
      def uri
        URI.parse('https://w3s.wmtransfer.com/asp/XMLOperations.asp')
      end

      private

      def builder
        Nokogiri::XML::Builder.new do |x|
          x.send('w3s.request') do
            x.reqn reqn
            x.wmid signer.wmid
            x.sign signature
            x.getoperations do
              x.purse opts[:purse]
              x.tranid opts[:tranid]
              x.wminvid opts[:wminvid]
              x.orderid opts[:orderid]
              x.datestart wmtime(opts[:datestart])
              x.datefinish wmtime(opts[:datefinish])
            end
          end
        end
      end

      def signed_string
        opts[:purse] + reqn
      end
    end
  end
end
