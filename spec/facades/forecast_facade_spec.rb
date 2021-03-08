require 'rails_helper'

describe ForecastFacade do
  it 'can get forecast for location' do
    denver = File.read('spec/fixtures/denver.json')
    stub_request(:get, /address/).to_return(
      status: 200, body: denver, headers: {}
      )

    denver_forecast = File.read('spec/fixtures/open_weather_denver.json')
    stub_request(:get, /onecall/).to_return(
      status: 200, body: denver_forecast, headers: {}
      )
      headers = {
        'Accept' => 'application/json', 
        'Content-Type' => 'application/json'
      }
      params = Hash.new
      params[:location] = "Denver,CO"
      results = ForecastFacade.map_quest(params)
      expect(results).to have_attributes(:current_weather => CurrentForecast, :daily_weather => Array, :hourly_weather => Array)
      expect(results.daily_weather.count).to eq(5)
      expect(results.hourly_weather.count).to eq(8)   
  end

  it 'can get a background image' do
    unsplash = File.read('spec/fixtures/unsplash_response.json')
    stub_request(:get, /photos/).to_return(
      status: 200, body: unsplash
      )
    params = Hash.new
    params[:location] = "Denver,CO"
    actual = ForecastFacade.get_background(params)
    expect(actual).to be_a(Background)
    expect(actual).to have_attributes(:image => Hash)
    expect(actual.image).to have_key(:description)
    expect(actual.image[:description]).to be_a(String)
    expect(actual.image).to have_key(:location)
    expect(actual.image).to have_key(:image_url)
    expect(actual.image).to have_key(:credit)
    expect(actual.image[:credit]).to have_key(:source)
    expect(actual.image[:credit]).to have_key(:author)
  end
end