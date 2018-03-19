RSpec.describe ShipitAPI::Package do
  before(:each) do
    ShipitAPI::Config.setup do |config|
      config.x_shipit_email = "staff@shipit.cl"
      config.x_shipit_access_token = "v8fH62dPTULmrAEXxhzB"
    end
  end

  before do
    VCR.insert_cassette 'package', record: :new_episodes
  end

  after do
    VCR.eject_cassette
  end

  describe "default instance attributes" do
    let(:package) { ShipitAPI::Package.new }
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

  describe "GET all packages" do
    let(:package) { ShipitAPI::Package.new }

    it 'get all packages in Array' do
      expect(package.all).to be_an_instance_of(Array)
    end
  end
end
