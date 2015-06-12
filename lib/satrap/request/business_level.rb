# -*- encoding : utf-8 -*-
module Satrap
  module Request
    class BusinessLevel < Base
      private

      def builder
        Nokogiri::XML::Builder.new do |x|
          x.send('WMIDLevel.request') do
            x.signerwmid signer.wmid
            x.wmid opts[:wmid]
          end
        end
      end
    end
  end
end
