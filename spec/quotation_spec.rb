RSpec.describe ShipitAPI::Quotation do
  before(:each) do
    ShipitAPI::Config.setup do |config|
      config.x_shipit_email = "api.account@shipit.cl"
      config.x_shipit_access_token = "PEV23AThMLiySxtpeP5N"
    end
  end

  let(:quotation) { ShipitAPI::Quotation.new }

  describe "default instance attributes" do
    before do
      package = { width: 10, height: 10, length: 10, weight: 1, to_commune_id: 308, destiny: 'Domicilio' }
      @response = ShipitAPI::Quotation.get_prices(package)
    end

    it 'must have a get_prices method' do
      expect(quotation).to respond_to(:get_prices)
    end

    it 'must parse the api response form JSON to Hash' do
      expect(@response).to be_an_instance_of(Hash)
    end
  end

  describe 'POST prices' do
    it 'get correclty price to LAS CONDES with package 10x10x10x1' do
      package = { width: 10, height: 10, length: 10, weight: 1, to_commune_id: 308, destiny: 'Domicilio' }
      quotation = ShipitAPI::Quotation.get_prices(package)
      expect(2660).to equal(quotation[:lower_price][:price])
    end

    it 'get price to LAS CONDES with package 10x10x10x1 including commune name' do
      package = { width: 10, height: 10, length: 10, weight: 1, commune_name: 'LAS CONDES', destiny: 'Domicilio' }
      quotation = ShipitAPI::Quotation.get_prices(package)
      expect(2660).to equal(quotation[:lower_price][:price])
    end
  end

end
