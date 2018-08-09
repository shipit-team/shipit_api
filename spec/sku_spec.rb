RSpec.describe ShipitAPI::Sku do
  before(:each) do
    ShipitAPI::Config.setup do |config|
      config.x_shipit_email = "staff@shipit.cl"
      config.x_shipit_access_token = "v8fH62dPTULmrAEXxhzB"
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
      sku_found = sku.find({ id: 3998 })
      expect(sku_found["name"]).to eq("SKU-011")
    end

    xit 'return a Hash by name' do
      sku_found = sku.find({ name: "SKU-011" })
      expect(sku_found["id"]).to eq(3998)
    end

    xit 'return an error if sku not exist'
  end
end
