module Satrap
  module Request
    module Base
      def reqn
        (Time.now.utc.to_f * 1000).floor.to_s
      end
      memoize :reqn
    end
  end
end
