require 'rails_helper'

describe Forecast do
  it 'exists' do
    data = {"dt": 1615147496,
    "sunrise": 1615123418,
    "sunset": 1615165104,
    "temp": 292.24,
    "feels_like": 288.34,
    "pressure": 1014,
    "humidity": 10,
    "dew_point": 261.34,
    "uvi": 4.13,
    "clouds": 100,
    "visibility": 10000,
    "wind_speed": 0.89,
    "wind_deg": 49,
    "wind_gust": 4.02,
    "weather": [
        {
            "id": 804,
            "main": "Clouds",
            "description": "overcast clouds",
            "icon": "04d"
        }
    ]
  }

    result = CurrentForecast.new(data)

    expect(result.sunrise).to eq("Sun,Mar 07 2021 06:23:38 -0700")
    expect(result.datetime).to eq("Sun,Mar 07 2021 13:04:56 -0700")
    expect(result.sunset).to eq("Sun,Mar 07 2021 17:58:24 -0700")
    expect(result.temperature).to eq(292.24)
    expect(result.feels_like).to eq(288.34)
    expect(result.humidity).to eq(10)
    expect(result.uvi).to eq(4.13)
    expect(result.visibility).to eq(10000)
    expect(result.conditions).to eq("overcast clouds")
    expect(result.icon).to eq("04d")
  end
end