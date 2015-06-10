module Satrap
  module Request
    class Base
      extend Memoist

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
        (Time.now.utc.to_f * 1000).floor.to_s
      end
      memoize :reqn
    end
  end
end
