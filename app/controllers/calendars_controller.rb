class CalendarsController < ApplicationController
  include Calendarific
  
  before_action :set_params

  def holidays
    @holidays = Calendarific::Client.holidays(@options)
    render json: @holidays
  end

  private

  def set_params
    @options = params.permit(:country, :year, :type).to_h
  end
end
