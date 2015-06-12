# -*- encoding : utf-8 -*-
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

      def reqn
        @reqn ||= xml.at('reqn').text.to_i
      end

      def retval
        @retval ||= xml.at('retval').text.to_i
      end

      def success?
        retval == 0
      end

      def retdesc
        @retdesc ||= root.at('retdesc').text
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
