# -*- encoding : utf-8 -*-
module Satrap
  module Response
    class Operation < Base
      def id
        @id ||= root['id'].to_i
      end

      def ts
        @ts ||= root['ts'].to_i
      end

      def pursesrc
        @pursesrc ||= root.at('pursesrc').text
      end

      def pursedest
        @pursedest ||= root.at('pursedest').text
      end

      def amount
        @amount ||= BigDecimal.new(root.at('amount'))
      end

      def comiss
        @comiss ||= BigDecimal.new(root.at('comiss'))
      end

      def opertype
        @opertype ||= root.at('opertype').text.to_i
      end

      def wminvid
        @wminvid ||= root.at('wminvid').text.to_i
      end

      def orderid
        @orderid ||= root.at('orderid').text.to_i
      end

      def tranid
        @tranid ||= root.at('tranid').text.to_i
      end

      def period
        @period ||= root.at('period').text.to_i
      end

      def desc
        @desc ||= root.at('desc').text
      end

      def datecrt
        @datecrt ||= wmtime(root.at('datecrt').text)
      end

      def dateupd
        @dateupd ||= wmtime(root.at('dateupd').text)
      end

      def corrwm
        @corrwm ||= root.at('corrwm').text
      end

      def rest
        @rest ||= BigDecimal.new(root.at('rest').text)
      end
      alias_method :balance, :rest

      module Decorator
        def complete?
          opertype == 0
        end

        def wminvid?
          wminvid > 0
        end
      end

      include Decorator

      private

      def root
        @root ||= xml.at('/operation')
      end
    end
  end
end
