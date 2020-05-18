require 'net/http'

class Converter
  def initialize(total, source = "UAH", target = "USD")
    @total = total
    @source = source
    @target = target
  end
  
end