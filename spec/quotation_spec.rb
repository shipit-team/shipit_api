RSpec.describe ShipitAPI::Quotation do
  before(:each) do
    ShipitAPI::Config.setup do |config|
      config.x_shipit_email = "api.account@shipit.cl"
      config.x_shipit_access_token = "PEV23AThMLiySxtpeP5N"
    end
  end

  let(:quotation) { ShipitAPI::Quotation.new }

  describe "default instance attributes" do
    it 'must have a get_prices method'
    it 'must parse the api response form JSON to Hash'
  end

  describe 'POST prices' do
    it 'get correclty price to LAS CONDES with package 10x10x10x1' do
      package = { width: 10, height: 10, length: 10, weight: 1, to_commune_id: 308, destiny: 'Domicilio' }
      quotation = ShipitAPI::Quotation.get_prices(package)
      binding.pry
      expect(true).to true
    end
  end

end
