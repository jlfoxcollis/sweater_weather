class UnsplashService
  class << self
    def get_background(params)
      response = faraday.get("/search/photos") do |req|
        req.params[:query] = params[:location]
        req.params[:per_page] = 1
      end
      parse(response)
    end

    private
    def parse(arg)
      JSON.parse(arg.body, symbolize_names: true)
    end

    def faraday
      Faraday.new('https://api.unsplash.com') do |faraday|
        faraday.params['client_id'] = ENV['UNSPLASH_KEY']
      end
    end
  end
end