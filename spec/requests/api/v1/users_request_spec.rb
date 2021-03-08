require 'rails_helper'

describe 'users controller' do
  it 'can create a user' do
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post "/api/v1/users", params: JSON.generate("email": "auron1731@yahoo.com", "password": "trigun", "password_confirmation": "trigun"), headers: headers

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    binding.pry
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to be_an(Integer)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq("users")
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes]).to have_key(:api_token)

    expect(parsed[:data][:attributes]).to_not have_key(:password)
    expect(parsed[:data][:attributes]).to_not have_key(:password_confirmation)
  end
end