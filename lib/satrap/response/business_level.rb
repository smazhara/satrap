# -*- encoding : utf-8 -*-
module Satrap
  module Response
    class BusinessLevel < Base
      def value
        xml.at('//level').inner_html.to_i
      end
    end
  end
end
