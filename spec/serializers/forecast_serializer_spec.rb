require 'rails_helper'

describe Forecast do
  it 'exists' do
    data = File.read("spec/fixtures/open_weather_denver.json")
    parsed = JSON.parse(data, symbolize_names: true)
    result = Forecast.new(parsed)

    serialized = ForecastSerializer.new(result).serialized_json
    parsed = JSON.parse(serialized, symbolize_names: true)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq("forecast")
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:current_weather)
    expect(parsed[:data][:attributes]).to have_key(:daily_weather)
    expect(parsed[:data][:attributes]).to have_key(:hourly_weather)

  end
end