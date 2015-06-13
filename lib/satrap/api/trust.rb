# -*- encoding : utf-8 -*-
module Satrap
  module Api
    class Trust < Base
      private

      def uri
        URI.parse('https://w3s.wmtransfer.com/asp/XMLTrustList2.asp')
      end
    end
  end
end
