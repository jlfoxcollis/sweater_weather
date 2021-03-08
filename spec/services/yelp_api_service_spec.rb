require 'rails_helper'

describe YelpApi do
  it 'works' do
    munchies = File.read('spec/fixtures/munchies.json')
    stub_request(:get, /search/).to_return(
      status: 200, body: munchies
      )
    params = Hash.new
    params[:destination] = "Pueblo, CO"
    params[:food] = "hamburger"
    results = YelpApi.get_restaurant(params)

    expect(results).to have_key(:businesses)
    expect(results[:businesses]).to be_an(Array)
    expect(results[:businesses].first).to have_key(:location)
    location = "#{results[:businesses].first[:location][:city]}, #{results[:businesses].first[:location][:state]}"
    expect(location).to eq(params[:destination])
  end
end