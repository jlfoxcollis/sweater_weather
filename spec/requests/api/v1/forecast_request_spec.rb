require 'rails_helper'

describe 'it can get weather for location' do
  before :each do
    denver = File.read('spec/fixtures/denver.json')
    stub_request(:get, /address/).to_return(
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
    get '/api/v1/forecast?location=Denver,CO', :headers => headers
  end

  it 'current_weather' do
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to be_a(Hash)
    expect(parsed[:data].keys.count).to eq(3)

    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to eq(nil)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq("forecast")
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to be_a(Hash)

    expect(parsed[:data][:attributes].keys.count).to eq(3)

    expect(parsed[:data][:attributes]).to have_key(:current_weather)
    expect(parsed[:data][:attributes][:current_weather]).to be_a(Hash)
    expect(parsed[:data][:attributes][:current_weather].keys.count).to eq(10)

    expect(parsed[:data][:attributes][:current_weather]).to have_key(:datetime)
    expect(parsed[:data][:attributes][:current_weather][:datetime]).to be_a(String)

    expect(parsed[:data][:attributes][:current_weather]).to have_key(:sunrise)
    expect(parsed[:data][:attributes][:current_weather][:sunrise]).to be_a(String)

    expect(parsed[:data][:attributes][:current_weather]).to have_key(:sunset)
    expect(parsed[:data][:attributes][:current_weather][:sunset]).to be_a(String)

    expect(parsed[:data][:attributes][:current_weather]).to have_key(:temperature)
    expect(parsed[:data][:attributes][:current_weather][:temperature]).to be_a(Float)

    expect(parsed[:data][:attributes][:current_weather]).to have_key(:feels_like)
    expect(parsed[:data][:attributes][:current_weather][:feels_like]).to be_a(Float)

    expect(parsed[:data][:attributes][:current_weather]).to have_key(:humidity)
    expect(parsed[:data][:attributes][:current_weather][:humidity]).to be_an(Integer)

    expect(parsed[:data][:attributes][:current_weather]).to have_key(:uvi)
    expect(parsed[:data][:attributes][:current_weather][:uvi]).to be_a(Float)

    expect(parsed[:data][:attributes][:current_weather]).to have_key(:visibility)
    expect(parsed[:data][:attributes][:current_weather][:visibility]).to be_an(Integer)

    expect(parsed[:data][:attributes][:current_weather]).to have_key(:conditions)
    expect(parsed[:data][:attributes][:current_weather][:conditions]).to be_a(String)

    expect(parsed[:data][:attributes][:current_weather]).to have_key(:icon)
    expect(parsed[:data][:attributes][:current_weather][:icon]).to be_a(String)
  end

  it 'daily_weather' do
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes]).to have_key(:daily_weather)
    expect(parsed[:data][:attributes][:daily_weather].count).to eq(5)
    parsed[:data][:attributes][:daily_weather].each do |daily|
      expect(daily.keys.count).to eq(7)
      expect(daily).to have_key(:date)
      expect(daily[:date]).to be_a(String)
      expect(daily).to have_key(:sunrise)
      expect(daily[:sunrise]).to be_a(String)
      expect(daily).to have_key(:sunset)
      expect(daily[:sunset]).to be_a(String)
      expect(daily).to have_key(:max_temp)
      expect(daily[:max_temp]).to be_a(Float)
      expect(daily).to have_key(:min_temp)
      expect(daily[:min_temp]).to be_a(Float)
      expect(daily).to have_key(:conditions)
      expect(daily[:conditions]).to be_a(String)
      expect(daily).to have_key(:icon)
      expect(daily[:icon]).to be_a(String)
    end
  end

  it 'hourly_weather' do
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed[:data][:attributes]).to have_key(:hourly_weather)
    expect(parsed[:data][:attributes][:hourly_weather].count).to eq(8)

    parsed[:data][:attributes][:hourly_weather].each do |hour|
      expect(hour.keys.count).to eq(4)

      expect(hour).to have_key(:time)
      expect(hour[:time]).to be_a(String)

      expect(hour).to have_key(:temperature)
      expect(hour[:temperature]).to be_a(Float)

      expect(hour).to have_key(:conditions)
      expect(hour[:conditions]).to be_a(String)

      expect(hour).to have_key(:icon)
      expect(hour[:icon]).to be_a(String)
    end
  end
end