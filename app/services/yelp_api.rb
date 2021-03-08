class YelpApi
  class << self

    def get_restaurant(params)
      response = faraday.get("/v3/businesses/search") do |req|
        req.params[:location] = params[:destination]
        req.params[:categories] = "food"
        req.params[:term] = params[:food]
      end
      parse(response)
    end

    private

    def parse(arg)
      JSON.parse(arg.body, symbolize_names: true)
    end

    def faraday
      Faraday.new('https://api.yelp.com') do |faraday|
        faraday.headers['Authorization'] = "Bearer #{ENV['YELP_KEY']}"
      end
    end
  end
end