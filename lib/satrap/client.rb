module Satrap
  class Client
    attr_reader :wmid

    def initialize(wmid = ENV['WMID'],
                   key = ENV['WMID_KEY'],
                   password = ENV['WMID_PASSWORD'])
      @wmid = wmid
      @key = key
      @password = password
    end

    def business_level(wmid)
      Request::BusinessLevel.new(signer, wmid: wmid)
    end

    private

    def signer
      Signer.new(@wmid, @password, @key)
    end
    memoize :signer

    def request(iface, opts = {})
      opts[:wmid] ||= wmid
    end
  end
end
