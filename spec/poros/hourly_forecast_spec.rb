require 'rails_helper'

describe HourlyForecast do
  it 'exists' do

    data = {
      dt: 1615309200,
      temp: 285.95,
      feels_like: 283.18,
      pressure: 1010,
      "humidity": 34,
      "dew_point": 264.31,
      "uvi": 3.7,
      "clouds": 88,
      "visibility": 10000,
      "wind_speed": 0.61,
      "wind_deg": 345,
      "weather": [
          {
              "id": 804,
              "main": "Clouds",
              "description": "overcast clouds",
              "icon": "04d"
          }
      ],
      "pop": 0
    }

    result = HourlyForecast.new(data)
    expect(result.time).to eq("10:00:00 AM")
    expect(result.temperature).to eq(285.95)
    expect(result.conditions).to eq("overcast clouds")
    expect(result.icon).to eq("04d")

  end
end