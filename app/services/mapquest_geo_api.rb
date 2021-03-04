class MapquestGeoApi
  class << self


    private

    def parse(arg)
      JSON.parse(arg.body, symbolize_names: true)
    end

    def faraday
      Faraday.new('www.mapquestapi.com'') do |faraday|
        faraday.params['key'] = ENV['MAPQUEST_API_KEY']
      end
    end
  end
end