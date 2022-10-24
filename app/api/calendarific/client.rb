module Calendarific
  class Client
    include Country

    def self.holidays(params)
      params[:country] = Country::Client.symbol if params[:country].nil?
      params[:year] = Date.current.year if params[:year].nil?

      Request.connection("get", "holidays", params)
    end
  end
end