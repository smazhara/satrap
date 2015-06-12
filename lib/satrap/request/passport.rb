# -*- encoding : utf-8 -*-
module Satrap
  module Request
    class Passport < Base
      private

      def builder
        Nokogiri::XML::Builder.new do |x|
          x.request do
            x.wmid signer.wmid
            x.passportwmid opts[:wmid]
            x.params do
              x.dict opts[:dict] || 0
              x.info opts[:info] || 1
              x.mode opts[:mode] || 0
            end
            x.sign signature
          end
        end
      end

      def signed_string
        signer.wmid + opts[:wmid]
      end
    end
  end
end
