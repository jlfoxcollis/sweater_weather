class OpenWeatherApi
  class << self

    def get_location(params)
      response = faraday.get("/data/2.5/onecall") do |req|
        req.params[:lat] = params[:lat]
        req.params[:lon] = params[:lon]
      end
      parse(response)
    end


    private

    def parse(arg)
      JSON.parse(arg.body, symbolize_names: true)
    end

    def faraday
      Faraday.new('https://api.openweathermap.org') do |faraday|
        faraday.params['appid'] = ENV['OPEN_WEATHER_API_KEY']
      end
    end
  end
end