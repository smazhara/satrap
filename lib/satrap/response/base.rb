module Satrap
  module Response
    class Base
      attr_reader :raw

      def initialize(raw)
        @raw = raw
      end

      def xml
        @xml ||= Nokogiri::XML(raw)
      end

      def ==(other)
        self.to_s == other.to_s
      end

      def wmtime(string)
        ActiveSupport::TimeZone.new('Moscow').parse(string).utc
      end
    end
  end
end
