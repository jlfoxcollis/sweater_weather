class Munchy
  attr_reader :destination_city,
              :travel_time,
              :forecast,
              :restaurant

  def initialize(data, yelp, params)
    @destination_city = params[:destination]
    @travel_time = t_time(data[:realTime])
    @forecast = weather(data)
    @restaurant = foodies(yelp)
  end

  def weather(data)
    forecast = OpenWeatherApi.get_location(data[:locations].last[:latLng])
    binding.pry
    {"summary": "",
     "temperature": ""}
  end 
  
  def foodies(yelp)
    {"name": yelp[:name],
     "address": yelp[:display_address]
    }
  end

  def t_time(data)
    convert = (data / 60)
    hours = (convert / 60)
    minutes = (convert % 60)
    "#{hours} hours #{minutes} min"
  end
end
