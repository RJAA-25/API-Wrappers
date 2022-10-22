require 'net/http'

module Calendarific
  class Request
    BASE_URL = "https://calendarific.com/api/v2/"
    TOKEN = Rails.application.credentials.calendarific.api_key

    def self.connection(endpoint, params)
      params[:api_key] = TOKEN

      uri = URI(BASE_URL)
      uri.path += endpoint
      uri.query = URI.encode_www_form(params)

      res = Net::HTTP.get_response(uri)
      
      if res.code.to_i == 200
        parsed = JSON.parse(res.body)
        return holidays = parsed["response"]["holidays"]
      else
        return { code: res.code, message: Errors.message(res.code.to_i) }
      end
    end
  end
end