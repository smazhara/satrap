# -*- encoding : utf-8 -*-
module Satrap
  module Response
    class Trusts < Base
      include Enumerable

      def each
        trusts.each do |trust|
          yield Trust.new(trust.to_s)
        end
      end

      def purse
        @purse ||= root.at('purse')
      end

      #private

      def root
        @root ||= xml.at('/w3s.response')
      end

      def trusts
        root.search('trustlist/trust')
      end
    end
  end
end
