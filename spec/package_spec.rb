RSpec.describe ShipitAPI::Package do
  before(:each) do
    ShipitAPI::Config.setup do |config|
      config.x_shipit_email = "api.account@shipit.cl"
      config.x_shipit_access_token = "PEV23AThMLiySxtpeP5N"
    end
  end

  before do
    VCR.insert_cassette 'package', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  let(:package) { ShipitAPI::Package.new }

  describe "default instance attributes" do
    let(:last_package) { package.latest }

    it 'must have a latest method' do
      expect(package).to respond_to(:latest)
    end

    it 'must parse the api response from JSON to Hash' do
      expect(package.latest).to be_an_instance_of(Hash)
    end

    it 'must get the right latest reference' do
      expect(package.latest['reference']).to eq(last_package['reference'])
    end
  end

  describe 'GET all packages' do
    it 'get all packages in Array' do
      expect(package.all).to be_an_instance_of(Array)
    end
  end

  describe 'GET package detail' do
    before do
      @package = package.latest
    end

    it 'return a Hash' do
      expect(@package).to be_an_instance_of(Hash)
    end
  end

  describe 'POST package to Pick and Pack service' do
    it 'created package' do
      hash = {
        reference: "test-1#{rand(36**4).to_s(36)}",
        full_name: "Nelson Jimenez",
        email: "nelson@shipit.cl",
        items_count: 1,
        cellphone: "+569905021",
        is_payable: false,
        packing: "Sin Empaque",
        shipping_type: "Normal",
        destiny: "Domicilio",
        courier_for_client: '',
        address_attributes: {
          commune_id: 12,
          street: "Nuestra señora de los angeles",
          number: "185",
          complement: "Oficina E"
        },
        with_purchase_insurance: false
      }

      package = ShipitAPI::Package.new(hash)
      @package = package.save

      expect(@package).to be_an_instance_of(Hash)
    end

    it 'must return an error with status 422' do
    end
  end

  describe 'dynamic attributes' do
    before do
      @package = package.latest
    end

    it 'must return the attribute values if present in latest' do
      expect(@package['reference']).to eq("app-007")
    end
  end
end
