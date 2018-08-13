RSpec.describe ShipitAPI::Sku do
  before(:each) do
    ShipitAPI::Config.setup do |config|
      config.x_shipit_email = "shipit.api.fulfillment@shipit.cl"
      config.x_shipit_access_token = "L4xxZi8-fh2iego8XssQ"
    end
  end

  let(:sku) { ShipitAPI::Sku.new }

  describe 'GET all skus' do
    it 'all packages in Array' do
      expect(sku.all).to be_an_instance_of(Array)
    end
  end

  describe 'GET package detail' do
    it 'return a Hash by id' do
      sku_found = sku.find({ id: 9946 })
      expect(sku_found[:name]).to eq("SKU-API-1")
    end

    xit 'return a Hash by name' do
      sku_found = sku.find({ name: "SKU-API-1" })
      binding.pry
      expect(sku_found[:id]).to eq(9946)
    end

    xit 'return an error if sku not exist'
  end
end
