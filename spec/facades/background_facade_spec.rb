require 'rails_helper'
describe BackgroundFacade do
  it 'can make multiple calls to build out a roadtrip' do
    unsplash = File.read('spec/fixtures/unsplash_response.json')
    stub_request(:get, /photos/).to_return(
      status: 200, body: unsplash
      )

    params = Hash.new
    params = {}
    params[:location] = "Denver,CO"
    product = BackgroundFacade.get_background(params)


    expect(product).to have_attributes(:image => Hash)
    expect(product.image).to have_key(:location)
    expect(product.image).to have_key(:image_url)
    expect(product.image).to have_key(:description)
    expect(product.image).to have_key(:credit)
    expect(product.image[:credit]).to have_key(:source)
    expect(product.image[:credit]).to have_key(:author)
  end
end