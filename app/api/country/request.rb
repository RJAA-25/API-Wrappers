require 'net/http'

module Country
  class Request
    BASE_URL = "https://api.country.is/"

    def self.connection
      uri = URI(BASE_URL)
      res = Net::HTTP.get_response(uri)
      symbol = JSON.parse(res.body)["country"]
    end
  end
end