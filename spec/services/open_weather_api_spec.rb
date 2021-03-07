require 'rails_helper'

describe OpenWeatherApi do
  it 'can get one time weather information for location' do
    denver = File.read('spec/fixtures/open_weather_denver.json')
    stub_request(:get, /onecall/).to_return(
      status: 200, body: denver
      )

    params = Hash.new
    params[:lat] = 39.738453
    params[:lng] = -104.984853
    results = OpenWeatherApi.get_location(params)

    expect(results).to have_key(:current)
    expect(results).to have_key(:daily)
    expect(results).to have_key(:hourly)
    expect(results).to_not have_key(:minutely)
    expect(results).to_not have_key(:alerts)
  end
end