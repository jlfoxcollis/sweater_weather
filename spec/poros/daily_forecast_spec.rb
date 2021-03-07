require 'rails_helper'

describe Forecast do
  it 'exists' do
    data = {
      dt: 1615316400,
      sunrise: 1615296030,
      sunset: 1615338029,
      temp: {
          day: 288.44,
          min: 43.23,
          max: 66.25,
          night: 282.9,
          eve: 287.56,
          morn: 279.6
      },
      "feels_like": {
                "day": 284.83,
                "night": 278.58,
                "eve": 282.86,
                "morn": 275.55
            },
            "pressure": 1008,
            "humidity": 30,
            "dew_point": 265.01,
            "wind_speed": 1.9,
            "wind_deg": 27,
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": 100,
            "pop": 0,
            "uvi": 5.03
    }

    result = DailyForecast.new(data)

    expect(result.date).to eq("Mar 09, 2021")
    expect(result.max_temp).to eq(66.25)
    expect(result.min_temp).to eq(43.23)
    expect(result.conditions).to eq("overcast clouds")
    expect(result.icon).to eq("04d")
    expect(result.sunrise).to eq("Tue,Mar 09 2021 06:20:30 -0700")
    expect(result.sunset).to eq("Tue,Mar 09 2021 18:00:29 -0700")
  end
end