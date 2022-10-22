module Calendarific
  class Client
    include Country

    def self.holidays(params)
      params[:country] = Country::Client.symbol if params[:country].nil?
      params[:year] = Date.current.year if params[:year].nil?

      Request.connection("holidays", params)
    end
  end
end