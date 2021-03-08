class Munchie
  attr_reader :destination_city,
              :travel_time,
              :forecast,
              :restaurant

  def initialize(data, yelp, weather)
    @destination_city = "#{data[:locations].last[:adminArea5]}, #{data[:locations].last[:adminArea3]}"
    @travel_time = t_time(data[:realTime])
    @forecast = weather(weather)
    @restaurant = foodies(yelp)
  end

  def weather(weather)
    {"summary": weather[:weather].first[:description],
     "temperature": weather[:temp]}
  end 
  
  def foodies(yelp)
    {"name": yelp[:name],
     "address": yelp[:location][:display_address]
    }
  end

  def t_time(data)
    convert = (data / 60)
    hours = (convert / 60)
    minutes = (convert % 60)
    "#{hours} hours #{minutes} min"
  end
end
