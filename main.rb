require 'net/http'
require 'json'

class Converter
  def initialize(total, from="USD", to = "UAH")
    @total = total
    @from = from
    @to = to
  end

  def convert!
    dict = get_value_of_currency_exchange
    rate = extract_exchange_rate(dict)
    @total * rate
  end

  private

  def api_url
    api_id = "1d1a713fa9134ef48f82bd595b866f87"
    "https://openexchangerates.org/api/latest.json?app_id=#{api_id}&base=#{@from}&symbols=#{@to}"
  end

  def get_value_of_currency_exchange
    url = URI(api_url)
    Net::HTTP.get(url)
  end

  def extract_exchange_rate(dict)
    JSON.parse(dict).dig("rates", @to)
  end
end

