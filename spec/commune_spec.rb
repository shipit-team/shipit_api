RSpec.describe ShipitAPI::Package do
  before(:each) do
    ShipitAPI::Config.setup do |config|
      config.x_shipit_email = "api.account@shipit.cl"
      config.x_shipit_access_token = "PEV23AThMLiySxtpeP5N"
    end
  end

  let(:commune) { ShipitAPI::Commune.new }

  describe "GET communes" do
    it 'return all communes' do
      communes = commune.all
      expect(communes).to be_an_instance_of(Array)
    end

    xit 'return a specific commune information by name' do
      commune_found = commune.find({ name: "Las Condes" })
      expect(commune_found["name"]).to eq("Las Condes")
    end

    it 'return a specific commune information by ID' do
      commune_found = commune.find({ id: 12 })
      expect(commune_found[:name]).to eq("ANTOFAGASTA")
    end

    it 'return a specific commune information by name' do
      commune_found = commune.find_by_name({ name: 'LAS CONDES' })
      expect(commune_found[:name]).to eq('LAS CONDES')
    end

    xit 'return an error if commune not exist'
  end
end
