require 'rails_helper'

describe 'when I get the munchies' do
  it 'can tell me travel time to restaurant and give review' do
    get "/api/v1/munchies", params: {start: "Denver,CO", destination: "Pueblo,CO", food: "hamburger"}

    expect(response).to be_successful

  end
end