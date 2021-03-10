require 'rails_helper'

describe Background do
  it 'exists' do

    data = {
      "id": "r82eni3j0bI",
      "created_at": "2020-09-06T12:05:36-04:00",
      "updated_at": "2021-03-07T15:14:21-05:00",
      "color": "#0c59c0",
      "blur_hash": "LhC*9MtlR*V@KUazoekCIwWYaKa#",
      "description": "Downtown Denver and Capitol Building",
      "urls": {
          "full": "https://images.unsplash.com/photo-1599408169542-620fc453382c?crop=entropy&cs=srgb&fm=jpg&ixid=MXwyMTMwNDR8MHwxfHNlYXJjaHwxfHxEZW52ZXJ8ZW58MHx8fA&ixlib=rb-1.2.1&q=85"
      },
      "links": {
          "download_location": "https://api.unsplash.com/photos/r82eni3j0bI/download"
      },
      "user": {
          "updated_at": "2021-03-07T06:57:28-05:00",
          "username": "andrewcoop",
          "name": "Andrew Coop"
      }
    } 

    params = Hash.new
    params[:location] = "Denver,CO"
    result = Background.new(data, params)

    expect(result).to have_attributes(:image => Hash)
  end
end