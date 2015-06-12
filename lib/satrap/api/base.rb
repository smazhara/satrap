# -*- encoding : utf-8 -*-
module Satrap
  module Api
    class Base
      def initialize(signer, opts)
        @signer = signer
        @opts = opts
      end

      def response
        @response ||= response_class.new(http_response.body)
      end

      def request
        @request ||= request_class.new(signer, opts)
      end

      def http_response
        @http_response ||= HttpClient.call(uri, request.xml)
      end

      private

      attr_reader :signer, :opts

      def request_class
        self.class.name.gsub('::Api::', '::Request::').constantize
      end

      def response_class
        self.class.name.gsub('::Api::', '::Response::').constantize
      end
    end
  end
end
