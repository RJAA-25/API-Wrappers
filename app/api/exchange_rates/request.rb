module ExchangeRates
  class Request
    BASE_URL = "https://api.apilayer.com/exchangerates_data/"
    TOKEN = Rails.application.credentials.exchange_rates.api_key

    def self.connection
      setup = {
        url: BASE_URL,
        headers: { apikey: TOKEN }
      }
      conn = Faraday.new(setup) do |f|
        f.request :json
        f.response :json
      end
    end

    def self.call(method, endpoint, params)
      res = connection.send(method, endpoint, params)
      if res.status == 200
        return res.body
      else
        return { code: res.status, status: Errors.status(res.status), body: res.body }
      end
    end
  end
end