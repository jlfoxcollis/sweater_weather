class BackgroundFacade
  class << self 
    def get_background(params)
      params[:search] = params[:location].split(',').first
      data = UnsplashService.get_background(params)[:results].first
      Background.new(data, params)
    end
  end
end