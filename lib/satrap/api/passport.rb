# -*- encoding : utf-8 -*-
module Satrap
  module Api
    class Passport < Base
      private

      def uri
        URI.parse('https://passport.webmoney.ru/asp/XMLGetWMPassport.asp')
      end
    end
  end
end
