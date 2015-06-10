module Satrap
  module Request
    class Passport < Base
      def uri
        URI.parse('https://passport.webmoney.ru/asp/XMLGetWMPassport.asp')
      end

      def response_class
        Response::Passport
      end

      private

      def builder
        Nokogiri::XML::Builder.new do |x|
          x.request do
            x.wmid signer.wmid
            x.passportwmid opts[:wmid]
            x.params do
              x.dict opts[:dict] || 0
              x.info opts[:info] || 1
              x.mode opts[:mode] || 0
            end
            x.sign signature
          end
        end
      end

      def signature
        sign(signer.wmid + opts[:wmid]) if opts[:mode] == 1
      end
    end
  end
end
