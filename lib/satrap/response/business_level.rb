module Satrap
  module Response
    class BusinessLevel
      include Response::Utils

      def value
        xml.at('//level').inner_html.to_i
      end
    end
  end
end

