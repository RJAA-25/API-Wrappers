class CalendarsController < ApplicationController
  include Calendarific

  def holidays
    options = params.permit(:country, :year, :type).to_h
    @holidays = Calendarific::Client.holidays(options)
    render json: @holidays
  end
end
