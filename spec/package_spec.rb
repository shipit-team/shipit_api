RSpec.describe ShipitAPI::Package do
  describe "default connection" do

    xit "check stub setting" do
      stub_request(:post, "www.google.com").
          with(headers: { 'Content-Length' => 3 }).to_return(body: "abc")

      req = Net::HTTP::Post.new("/")
      req['Content-Length'] = 3

      Net::HTTP.start('www.google.com', 80) {|http|
        http.request(req, 'abc')
      }

      request(:post, "www.google.com").
        with(body: "abc", headers: { 'Content-Length' => 3 }).should have_been_made.once

      request(:get, "www.something.com").should_not have_been_made
    end
  end
end
