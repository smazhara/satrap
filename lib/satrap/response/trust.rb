module Satrap
  module Response
    class Trust < Base
      def id
        @id ||= root['id'].to_i
      end

      def inv
        @inv ||= root['inv'].to_i
      end

      def trans
        @trans ||= root['trans'].to_i
      end

      def balance
        @balance ||= root['purse'].to_i
      end

      def transhist
        @transhist ||= root['transhist'].to_i
      end

      def msg_hist
        @msg_hist ||= root['msg_hist'].to_i
      end

      def msg_hist
        @msg_hist ||= root['msg_hist'].to_i
      end

      def purse
        @purse ||= root.at('purse').text
      end

      def daylimit
        @daylimit ||= BigDecimal.new(root.at('daylimit').text)
      end

      private

      def root
        @root ||= xml.at('/trust')
      end
    end
  end
end
