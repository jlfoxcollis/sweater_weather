require 'rails_helper'

describe 'it can return an image based on location' do
  it 'when I look up Denver,CO I get an image back' do
    unsplash = File.read('spec/fixtures/unsplash_response.json')
    stub_request(:get, /photos/).to_return(
      status: 200, body: unsplash
      )
      headers = {
        'Accept' => 'application/json', 
        'Content-Type' => 'application/json'
      }
    get "/api/v1/backgrounds", params: {location: "Denver,CO"}, headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to eq(nil)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq("image")
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes][:image]).to have_key(:location)
    expect(parsed[:data][:attributes][:image]).to have_key(:description)
    expect(parsed[:data][:attributes][:image]).to have_key(:image_url)
    expect(parsed[:data][:attributes][:image]).to have_key(:credit)
    expect(parsed[:data][:attributes][:image][:credit]).to have_key(:source)
    expect(parsed[:data][:attributes][:image][:credit]).to have_key(:author)
  end

  it 'can rescue error when service is down' do
    unsplash = nil
    stub_request(:get, /photos/).to_return(
      status: 200, body: unsplash
      )
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    get "/api/v1/backgrounds", params: {location: "Denver,CO"}, headers: headers

    expect(response).to_not be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq("Something went wrong.  Please try again later.")
  end
end