require 'rails_helper'

describe MapquestGeoApi do
  it 'works' do
    denver = File.read('spec/fixtures/denver.json')
    stub_request(:get, /address/).to_return(
      status: 200, body: denver
      )
    params = Hash.new
    params[:location] = "Denver,CO"
    results = MapquestGeoApi.get_location(params)

    expect(results[:results].first[:locations].first[:latLng]).to have_key(:lat)
    expect(results[:results].first[:locations].first[:latLng]).to have_key(:lng)
  end
end