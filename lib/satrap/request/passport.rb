module Satrap
  module Request
    class Passport
      def initialize(signer, opts = {})
        @opts = opts
        @signer = signer
      end

      def xml
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

      private

      def signature
        sign(signer.wmid + opts[:wmid]) if opt[:mode] == 1
      end
    end
  end
end
