# -*- encoding : utf-8 -*-
module Satrap
  module Response
    class Passport < Base
      def full_access?
        fullaccess.text == '1'
      end

      private

      def root
        xml.at('/response')
      end

      def fullaccess
        root.at('fullaccess')
      end
    end
  end
end
