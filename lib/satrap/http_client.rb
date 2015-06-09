module Satrap
  class HttpClient
    attr_reader :interface, :opts

    def initialize(request)
      @request = request
    end

    def self.run(request)
      new(request).run
    end

    private

    def response
      request.response_class.new(http_response)
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
      Net::HTTP.new(uri.host, uri.port) do |http|
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        http.ca_file = ca_file
        http.use_ssl = true
        http.ssl_version = :TLSv1
      end
    end

    def ca_file
      File.dirname(__FILE__) + '/../../ssl-certs/ca_bundle.crt'
    end
  end
end
