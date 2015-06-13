# -*- encoding : utf-8 -*-
module Satrap
  module Api
    class Operations < Base
      private
      def uri
        URI.parse('https://w3s.wmtransfer.com/asp/XMLOperations.asp')
      end
    end
  end
end
