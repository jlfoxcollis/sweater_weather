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
end