module Satrap
  module Request
    class Base
      attr_reader :signer, :opts

      def initialize(signer, opts = {})
        @opts = opts
        @signer = signer
      end

      def xml
        builder.to_xml
      end

      private

      def reqn
        @reqn ||= (Time.now.utc.to_f * 1000).floor.to_s
      end

      def wmtime(time)
        time.strftime('%Y%m%d %T')
      end

      def signature
        signer.sign(signed_string)
      end
    end
  end
end
