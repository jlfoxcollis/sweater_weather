class Background
  attr_reader :image

  def initialize(data, params)
    @image = image_hash(data, params)
  end

  def image_hash(data, params)
    {location: params[:location],
    image_url: data[:urls][:full],
    description: data[:description],
    credit: {
      source: data[:user][:download_location],
      author: data[:user][:name]
    }}
  end
end