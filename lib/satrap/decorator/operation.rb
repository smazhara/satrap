module Satrap
  module Decorator
    module Operation
      def complete?
        opertype == 0
      end

      def wminvid?
        wminvid > 0
      end

      def rest; end
      alias :balance :rest
    end
  end
end
