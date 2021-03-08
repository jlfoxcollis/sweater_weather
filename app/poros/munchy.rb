class Munchy

  def initialize(data, yelp, params)
    @destination_city = params[:destination]
    @travel_time = Time.at(data[:route][:realTime]).strftime("%I:%M%p")
    @forecast = weather(data)
    @restaurant = foodies(yelp)
  end

  def weather(data)
    forecast = OpenWeatherApi.get_location(data[:locations].last[:latLng])
    {"summary": "",
     "temperature": ""}
  end

  def foodies(data)
  end
end
