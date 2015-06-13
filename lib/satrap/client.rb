# -*- encoding : utf-8 -*-
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
      Api::BusinessLevel.new(signer, wmid: wmid).http_response
    end

    private

    def signer
      @signer ||= Signer.new(@wmid, @password, @key)
    end

    def request(iface, opts = {})
      opts[:wmid] ||= wmid
    end
  end
end
