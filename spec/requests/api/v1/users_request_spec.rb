require 'rails_helper'

describe 'users controller' do
  it 'can create a user' do
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post "/api/v1/users", params: JSON.generate("users": {"email": "auron1731@yahoo.com", "password": "trigun", "password_confirmation": "trigun"}), headers: headers

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)
    expect(parsed[:data]).to have_key(:id)
    expect(parsed[:data][:id]).to be_a(String)
    expect(parsed[:data]).to have_key(:type)
    expect(parsed[:data][:type]).to eq("users")
    expect(parsed[:data]).to have_key(:attributes)
    expect(parsed[:data][:attributes]).to have_key(:email)
    expect(parsed[:data][:attributes]).to have_key(:api_key)

    expect(parsed[:data][:attributes]).to_not have_key(:password)
    expect(parsed[:data][:attributes]).to_not have_key(:password_confirmation)
  end

  it 'cant create a user with password mismatch' do
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post "/api/v1/users", params: JSON.generate("users": {"email": "auron1731@yahoo.com", "password": "trigun", "password_confirmation": "123"}), headers: headers

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:errors)
    expect(parsed[:errors].first).to eq("Password confirmation doesn't match Password")
  end

  it 'cant create user with used email' do
    user = User.create(email: "admin@example.com", password: "trigun", password_confirmation: "trigun")
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post "/api/v1/users", params: JSON.generate("users": {"email": "admin@example.com", "password": "trigun", "password_confirmation": "trigun"}), headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:errors)
    expect(parsed[:errors].first).to eq("Email has already been taken")
  end

  it 'cant create user with bad email' do
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post "/api/v1/users", params: JSON.generate("users": {"email": "example.com", "password": "trigun", "password_confirmation": "trigun"}), headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:errors)
    expect(parsed[:errors].first).to eq("Email is invalid")
  end

  it 'cant create user with used email and bad password' do
    user = User.create(email: "admin@example.com", password: "trigun", password_confirmation: "trigun")
    headers = {
      'Accept' => 'application/json', 
      'Content-Type' => 'application/json'
    }
    post "/api/v1/users", params: JSON.generate("users": {"email": "admin@example.com", "password": "", "password_confirmation": ""}), headers: headers

    expect(response).to be_successful

    parsed = JSON.parse(response.body, symbolize_names: true)

    expect(parsed).to have_key(:errors)
    expect(parsed[:errors]).to eq(["Email has already been taken", "Password can't be blank", "Password can't be blank"])
  end

  
end