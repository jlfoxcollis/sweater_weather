require 'rails_helper'

describe Forecast do
  it 'exists' do
    data = {
      dt: 1615316400,
      sunrise: 1615296030,
      sunset: 1615338029,
      temp: {
          day: 288.44,
          min: 279.6,
          max: 290.56,
          night: 282.9,
          eve: 287.56,
          morn: 279.6
      }
    }

    result = Forecast.new(data)

    expect(result.current_weather.sunrise).to eq("March")
  end
end