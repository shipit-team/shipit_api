RSpec.feature 'external request' do
  it 'queries FactoryGirl contributors on Github' do
    uri = URI('https://api.github.com/repos/thoughtbot/factory_girl/contributors')
    response = Net::HTTP.get(uri)
    expect(response).to be_an_instance_of(String)
  end
end
