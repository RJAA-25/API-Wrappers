module ExchangeRates
  class Errors
    def self.status(code)
      case code
      when 400
        return "Bad Request"
      when 401 
        return "Unauthorized"
      when 404
        return "Not Found"
      when 429
        return "Too Many Requests"
      else
        return "Server Error"
      end
    end
  end
end