module ExchangeRates
  class Client
    def symbols
      Request.call("get", "symbols")
    end

    def latest(params = {})
      Request.call("get", "latest", params)
    end

    def convert(params = {})
      Request.call("get", "convert", params)
    end
  end
end