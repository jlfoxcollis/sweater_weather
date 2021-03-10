class MapquestGeoService
  class << self

    def get_location(params)
      response = faraday.get("/geocoding/v1/address") do |req|
        req.params[:location] = params[:location]
      end
      parse(response)
    end

    def get_directions(params)
      response = faraday.get("/directions/v2/route") do |req|
        req.params[:from] = params[:origin]
        req.params[:to] = params[:destination]
        req.params[:thumbMaps] = false
      end
      parse(response)
    end

    private

    def parse(arg)
      JSON.parse(arg.body, symbolize_names: true)
    end

    def faraday
      Faraday.new('https://www.mapquestapi.com') do |faraday|
        faraday.params['key'] = ENV['MAPQUEST_API_KEY']
      end
    end
  end
end