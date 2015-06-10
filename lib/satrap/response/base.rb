module Satrap
  module Response
    class Base
      extend Memoist

      attr_reader :raw

      def initialize(raw)
        @raw = raw
      end

      def xml
        Nokogiri::XML(raw)
      end
      memoize :xml
    end
  end
end
