# -*- encoding : utf-8 -*-
module Satrap
  module Response
    class Passport < Base
      module Standard
        def fullaccess
          root.at('fullaccess').text
        end
      end

      module Decorator
        def fullaccess?
          fullaccess == '1'
        end

        def wmids
          @wmids ||= certinfo.search('wmids/row').map do |xml|
            Wmid.new(xml)
          end
        end
      end

      include Standard
      include Decorator

      private

      def certinfo
        @certinfo ||= root.at('certinfo')
      end
    end
  end
end
