require 'rails_helper'

describe Forecast do
  it 'exists' do
    data = File.read("spec/fixtures/open_weather_denver.json")
    parsed = JSON.parse(data, symbolize_names: true)
    result = Forecast.new(parsed)

    expect(result).to be_a(Forecast)
    expect(result.current_weather.sunrise).to eq("Sun,Mar 07 2021 06:23:38 -0700")
    expect(result.current_weather).to be_a(CurrentForecast)
    expect(result.daily_weather).to be_an(Array)
    expect(result.daily_weather.first).to be_a(DailyForecast)
    expect(result.hourly_weather).to be_an(Array)
    expect(result.hourly_weather.first).to be_an(HourlyForecast)

  end
end