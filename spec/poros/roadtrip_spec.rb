require 'rails_helper'

describe Roadtrip do
  it 'exists' do
    denver = File.read('spec/fixtures/route.json')
    stub_request(:get, /route/).to_return(
      status: 200, body: denver, headers: {}
      )
    parsed1 = JSON.parse(denver, symbolize_names: true)

    denver_forecast = File.read('spec/fixtures/open_weather_denver.json')
    stub_request(:get, /onecall/).to_return(
      status: 200, body: denver_forecast, headers: {}
      )
    parsed2 = JSON.parse(denver_forecast, symbolize_names: true)
    params = Hash.new
    params[:origin] = "Denver,CO"
    params[:destination] = "Pueblo,CO"

    result = Roadtrip.new(parsed1, parsed2, params)
    
    expect(result).to have_attributes(:start_city => params[:origin])
  end
end