RSpec.describe ShipitAPI::Setting do
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

  let(:setting) { ShipitAPI::Setting.new }

  describe "GET setting" do
  end

  describe "PUT setting" do

  end
end
