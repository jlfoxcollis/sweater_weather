require 'rails_helper'

describe MunchiesFacade do
  it 'can get me to the food' do
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
    params = Hash.new
    params[:start] = "Denver,CO"
    params[:destination] = "Pueblo,CO"
    params[:food] = "hamburger"
    restaurant = MunchiesFacade.find_the_munchies(params)
    expect(restaurant).to be_a(Munchie)
    expect(restaurant).to have_attributes(:destination_city => "Lake Havasu City, AZ", :travel_time => "14 hours 27 min")
    expect(restaurant).to have_attributes(:forecast => {:summary => "overcast clouds", :temperature => 292.24}, :restaurant => {:name => "Bingo Burger", :address => ["101 Central Plz", "Pueblo, CO 81003"]})
  end
end