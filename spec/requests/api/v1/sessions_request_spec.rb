require 'rails_helper'

describe 'when I receive a post request for sessions' do
  it 'can start a new session' do
    user = User.create(email: "admin@example.com", password: "trigun", password_confirmation: "trigun")
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post '/api/v1/sessions', params: JSON.generate("users": {email: "admin@example.com", password: "trigun"}), headers: headers
    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq("users")
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes]).to have_key(:api_key)

    expect(parsed[:data][:attributes]).to_not have_key(:password)
    expect(parsed[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  xit 'can fail to start new session' do
    user = User.create(email: "admin@example.com", password: "trigun", password_confirmation: "trigun")
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post '/api/v1/sessions', params: JSON.generate("users": {email: "admin@example.com", password: "noob"}), headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq("Invalid Credentials")
  end

  xit 'can fail to start new session' do
    user = User.create(email: "admin@example.com", password: "trigun", password_confirmation: "trigun")
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post '/api/v1/sessions', params: JSON.generate("users": {email: "admin@example.com", password: ""}), headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq("Invalid Credentials")
  end

  xit 'can fail to start new session' do
    user = User.create(email: "admin@example.com", password: "trigun", password_confirmation: "trigun")
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post '/api/v1/sessions', params: JSON.generate("users": {email: "adm1n@example.com", password: "noob"}), headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq("Invalid Credentials")
  end

  xit 'can fail to start new session' do
    user = User.create(email: "admin@example.com", password: "trigun", password_confirmation: "trigun")
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post '/api/v1/sessions', params: JSON.generate("users": {email: "admin@example.com", password: "noob"}), headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:error)
    expect(parsed[:error]).to eq("Invalid Credentials")
  end

end