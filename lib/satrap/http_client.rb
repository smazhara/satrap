module Satrap
  class HttpClient
    def self.call(uri, xml)
      new(uri, xml).call
    end

    def call
      http.post(uri.path, xml, headers)
    end

    private

    attr_reader :uri, :xml

    def initialize(uri, xml)
      @uri = uri
      @xml = xml
    end

    def headers
      {
        'Content-Type' => 'text/xml'
      }
    end

    def http
      http = Net::HTTP.new(uri.host, uri.port)
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
