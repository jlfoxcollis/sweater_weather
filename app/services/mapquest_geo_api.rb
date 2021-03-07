class MapquestGeoApi
  class << self

    def get_location(params)
      response = faraday.get("/geocoding/v1/address") do |req|
        req.params[:location] = params[:location]
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