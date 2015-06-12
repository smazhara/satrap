module Satrap
  module Response
    class Operations < Base
      include Enumerable

      def each
        operations.each do |operation|
          yield Operation.new(operation.to_s)
        end
      end

      private

      def operations
        xml.search('//operations/operation')
      end
    end
  end
end
