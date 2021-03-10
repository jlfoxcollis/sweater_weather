require 'rails_helper'
describe RoadTripFacade do
  it 'can make multiple calls to build out a roadtrip' do
    @user = User.create(email: "admin@example.com", password: "trigun", password_confirmation: "trigun")
    denver = File.read('spec/fixtures/route.json')
    stub_request(:get, /route/).to_return(
      status: 200, body: denver, headers: {}
      )

    denver_forecast = File.read('spec/fixtures/open_weather_denver.json')
    stub_request(:get, /onecall/).to_return(
      status: 200, body: denver_forecast, headers: {}
      )

    params = Hash.new
    params[:road_trip] = {}
    params[:road_trip][:origin] = "Denver,CO"
    params[:road_trip][:destination] = "LakeHavasuCity,CO"
    params[:road_trip][:api_key] = @user.api_key
    product = RoadTripFacade.get_directions(params)


    expect(product).to have_attributes(:start_city => String)
  end
end