require 'rails_helper'

describe 'when I want to go on a trip' do
  before :each do
    @user = User.create(email: "admin@example.com", password: "trigun", password_confirmation: "trigun")
  end

  it 'can return the roadtrip details' do
    post "/api/v1/road_trip", params: JSON.generate(origin: "Denver,CO", destination: "Pueblo,CO", api_key: @user.api_key)

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
end