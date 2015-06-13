module Satrap
  module Response
    class Wmid < Base
      module Standard
        def admlocked
          root['admlocked'].to_i
        end

        def datecrt
          wmtime(root['datecrt'])
        end
      end

      include Standard

      private

      def root
        xml.at('/row')
      end
    end
  end
end
