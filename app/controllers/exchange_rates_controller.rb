class ExchangeRatesController < ApplicationController
  include ExchangeRates

  before_action :setup_api, :set_params

  def symbols
    @symbols = @exchange_rates.symbols
    render json: @symbols
  end

  def latest
    @latest = @exchange_rates.latest(@options)
    render json: @latest
  end

  def convert
    @convert = @exchange_rates.convert(@options)
    render json: @convert
  end

  private

  def setup_api
    @exchange_rates = ExchangeRates::Client.new
  end

  def set_params
    @options = params.permit(:base, :symbols, :to, :from, :amount, :date).to_h
  end
end
