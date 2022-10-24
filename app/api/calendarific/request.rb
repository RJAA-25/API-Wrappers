require 'net/http'

module Calendarific
  class Request
    BASE_URL = "https://calendarific.com/api/v2/"
    TOKEN = Rails.application.credentials.calendarific.api_key

    def self.connection(method, endpoint, params)
      params[:api_key] = TOKEN

      uri = URI(BASE_URL)
      uri.path += endpoint
      uri.query = URI.encode_www_form(params)

      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true

      req = Net::HTTP::Get.new(uri) if method == "get"

      res = https.request(req)
      parsed = JSON.parse(res.body).to_h
      
      if res.code.to_i == 200
        return holidays = parsed
      else
        return { code: res.code, status: Errors.status(res.code.to_i), body: parsed }
      end
    end
  end
end