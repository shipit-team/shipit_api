RSpec.describe ShipitAPI::Setting do
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

  describe 'API call from external Apps' do
    let(:setting) { ShipitAPI::Setting.new }

    it "GET my setting info" do
      expect(setting.info).to be_an_instance_of(Hash)
    end

    it "PUT setting return new for webhook" do
      object = setting.save({ packages_webhook_url: 'www.example.com/webhook' })
      expect(object.packages_webhook_url).to 'www.example.com/weebhook'
    end
  end
end
