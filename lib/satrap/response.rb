module Satrap
  class Response
    def initialize(http_response)
      @http_response = http_response
    end

    def success?
      http_response.is_a?(Net::HTTPSuccess)
    end

    private

    attr_reader :http_response
  end
end
