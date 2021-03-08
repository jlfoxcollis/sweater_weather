require 'rails_helper'

describe Munchie do
  it 'exists' do

    data = {
      "locations": ["adminArea5": "Denver","adminArea3": "CO"],
      "realTime": 12345
    }

    yelp = {
      "name": "business",
      "display_address": "123 deadpool dr, LHC AZ 86403"
    }

    weather = {
      "temp": 78,
      "weather": [{
        "description": "Not too sunny"
      }]
    }

    results = Munchie.new(data, yelp, weather)
    expect(results).to have_attributes(:destination_city => String)
    expect(results).to have_attributes(:travel_time => String)
    expect(results).to have_attributes(:forecast => Hash)
    expect(results).to have_attributes(:restaurant => Hash)


  end
end