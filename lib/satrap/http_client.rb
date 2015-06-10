module Satrap
  class HttpClient
    def self.make(request)
      new(request).response
    end

    def response
      request.response_class.new(http_response.body)
    end

    private

    attr_reader :request

    def initialize(request)
      @request = request
    end

    def http_response
      http.post(request.uri.path, request.xml, headers)
    end

    def headers
      {
        'Content-Type' => 'text/xml'
      }
    end

    def http
      http = Net::HTTP.new(request.uri.host, request.uri.port)
      http.verify_mode = OpenSSL::SSL::VERIFY_PEER
      http.ca_file = ca_file
      http.use_ssl = true
      http.ssl_version = :TLSv1
      http
    end

    def ca_file
      File.dirname(__FILE__) + '/../../ssl-certs/ca_bundle.crt'
    end
  end
end
