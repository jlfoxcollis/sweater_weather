require 'rails_helper'

describe Forecast do
  it 'exists' do
    data = "dt": 1615147496,
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

    expect(result.current_weather.sunrise).to eq("March")
  end
end