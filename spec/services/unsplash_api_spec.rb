require 'rails_helper'

describe UnsplashService do
  it 'get_background' do
    unsplash = File.read('spec/fixtures/unsplash_response.json')
    stub_request(:get, /photos/).to_return(
      status: 200, body: unsplash
      )
    params = Hash.new
    params[:query] = "Denver"
    results = UnsplashService.get_background(params)

    expect(results).to have_key(:results)
    image = results[:results].first
    expect(image).to have_key(:description)
    expect(image).to have_key(:user)
    expect(image).to have_key(:urls)
    expect(image).to have_key(:links)
    expect(image[:links]).to have_key(:download_location)
    expect(image[:urls]).to have_key(:full)
    expect(image[:user]).to have_key(:name)
  end
end