require 'rails_helper'

describe 'when I want to go on a trip' do
  before :each do
    @user = User.create(email: "admin@example.com", password: "trigun", password_confirmation: "trigun")
  end

  it 'can return the roadtrip details' do
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
    post "/api/v1/road_trip", params: JSON.generate("road_trip": {"origin": "Denver,CO", "destination": "Pueblo,CO", "api_key": @user.api_key}), headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data]).to have_key(:attributes)
    trip = parsed[:data][:attributes]

    expect(trip).to have_key(:start_city)
    expect(trip).to have_key(:end_city)
    expect(trip).to have_key(:travel_time)
    expect(trip).to have_key(:weather_at_eta)
    expect(trip[:weather_at_eta]).to have_key(:temperature)
    expect(trip[:weather_at_eta]).to have_key(:conditions)
  end

  it 'can return the roadtrip details' do
    denver = File.read('spec/fixtures/lhctoanchorage.json')
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
    post "/api/v1/road_trip", params: JSON.generate("road_trip": {"origin": "LakeHavasuCity,AZ", "destination": "Anchorage,AK", "api_key": @user.api_key}), headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data]).to have_key(:attributes)
    trip = parsed[:data][:attributes]

    expect(trip).to have_key(:start_city)
    expect(trip).to have_key(:end_city)
    expect(trip).to have_key(:travel_time)
    expect(trip).to have_key(:weather_at_eta)
    expect(trip[:weather_at_eta]).to have_key(:temperature)
    expect(trip[:weather_at_eta]).to have_key(:conditions)
  end

  it 'can return the roadtrip details' do
    anchorage = File.read('spec/fixtures/anchorage.json')
    stub_request(:get, /route/).to_return(
      status: 200, body: anchorage, headers: {}
      )

    denver_forecast = File.read('spec/fixtures/open_weather_denver.json')
    stub_request(:get, /onecall/).to_return(
      status: 200, body: denver_forecast, headers: {}
      )
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post "/api/v1/road_trip", params: JSON.generate("road_trip": {"origin": "Denver,CO", "destination": "Anchorage,AK", "api_key": @user.api_key}), headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data]).to have_key(:attributes)
    trip = parsed[:data][:attributes]

    expect(trip).to have_key(:start_city)
    expect(trip).to have_key(:end_city)
    expect(trip).to have_key(:travel_time)
    expect(trip[:travel_time]).to eq("impossible route")
    expect(trip).to have_key(:weather_at_eta)
    expect(trip[:weather_at_eta]).to eq(nil)
  end

  it 'can error with bad api_key' do
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
    post "/api/v1/road_trip", params: JSON.generate("road_trip": {"origin": "Denver,CO", "destination": "Pueblo,CO", "api_key": "12345"}), headers: headers

    expect(response).to_not be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq("Unauthorized")
  end

  it 'can return the roadtrip details' do
    denver = File.read('spec/fixtures/route.json')
    stub_request(:get, /route/).to_timeout

    denver_forecast = File.read('spec/fixtures/open_weather_denver.json')
    stub_request(:get, /onecall/).to_return(
      status: 200, body: denver_forecast, headers: {}
      )
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post "/api/v1/road_trip", params: JSON.generate("road_trip": {"origin": "Denver,CO", "destination": "Pueblo,CO", "api_key": @user.api_key}), headers: headers

    expect(response).to_not be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq("Something went wrong.  Please try again later.")
  end
end