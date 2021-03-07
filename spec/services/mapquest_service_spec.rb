require 'rails_helper'

describe MapquestGeoApi do
  it 'works' do
    denver = File.read('spec/fixtures/denver.json')
    stub_request(:get, /address/).to_return(
      status: 200, body: denver
      )

      
  end
end