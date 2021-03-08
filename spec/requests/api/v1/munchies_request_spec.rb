require 'rails_helper'

describe 'when I get the munchies' do
  it 'can tell me travel time to restaurant and give review' do
    munchies = File.read('spec/fixtures/munchies.json')
    stub_request(:get, /search/).to_return(
      status: 200, body: munchies, headers: {}
      )
      denver = File.read('spec/fixtures/route.json')
      stub_request(:get, /route/).to_return(
        status: 200, body: denver, headers: {}
        )
  
      denver_forecast = File.read('spec/fixtures/open_weather_denver.json')
      stub_request(:get, /onecall/).to_return(
        status: 200, body: denver_forecast, headers: {}
        )
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    get "/api/v1/munchies", params: {start: "Denver,CO", destination: "Pueblo,CO", food: "hamburger"}, headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to eq(nil)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq("munchie")
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:destination_city)
    expect(parsed[:data][:attributes]).to have_key(:travel_time)
    expect(parsed[:data][:attributes]).to have_key(:forecast)
    expect(parsed[:data][:attributes][:forecast]).to be_a(Hash)
    expect(parsed[:data][:attributes][:forecast]).to have_key(:summary)
    expect(parsed[:data][:attributes][:forecast]).to have_key(:temperature)

    expect(parsed[:data][:attributes]).to have_key(:restaurant)
    expect(parsed[:data][:attributes][:restaurant]).to be_a(Hash)
    expect(parsed[:data][:attributes][:restaurant]).to have_key(:name)
    expect(parsed[:data][:attributes][:restaurant]).to have_key(:address)
  end
end